package com.srnpr.yescms.support;

import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;

import com.srnpr.yescms.member.model.MemberForgetInput;
import com.srnpr.yescms.member.model.MemberLoginInput;
import com.srnpr.yescms.member.model.MemberRegInput;
import com.srnpr.yescms.member.model.MemberResetInput;
import com.srnpr.yescms.member.model.MemberResult;
import com.srnpr.yescms.member.model.UserInfoInput;
import com.srnpr.yescms.member.model.UserPassInput;
import com.srnpr.zapcom.baseclass.BaseClass;
import com.srnpr.zapcom.basehelper.FormatHelper;
import com.srnpr.zapcom.basehelper.SecrurityHelper;
import com.srnpr.zapcom.basemodel.MDataMap;
import com.srnpr.zapcom.basesupport.MailSupport;
import com.srnpr.zapdata.dbdo.DbUp;
import com.srnpr.zapweb.helper.WebHelper;
import com.srnpr.zapweb.webdo.WebConst;
import com.srnpr.zapweb.webmodel.MWebResult;
import com.srnpr.zapweb.websupport.OauthSupport;

public class MemberSupport extends BaseClass {

	public MemberResult memberReginster(MemberRegInput input) {
		MemberResult result = new MemberResult();

		
		if(result.upFlagTrue()&&StringUtils.isNotBlank(input.getVerifyUqcode()))
		{
			String sCode=DbUp.upTable("mc_verify_code").one("uqcode",input.getVerifyUqcode()).get("verify_code");
			
			if(StringUtils.isBlank(input.getMemberVerify())||    !sCode.equals(input.getMemberVerify()))
			{
				
				result.inErrorMessage(965305018);
			}
			
			
			
		}
		
		
		if (result.upFlagTrue()
				&& DbUp.upTable("mc_member_info").count("member_email",
						input.getMemberEmail().trim()) > 0) {
			result.inErrorMessage(965305001);
		}

		if (result.upFlagTrue()
				&& DbUp.upTable("mc_member_info").count("member_phone",
						input.getMemberPhone().trim()) > 0) {
			result.inErrorMessage(965305002);
		}

		if (result.upFlagTrue()
				&& !input.getMemberPassword().trim()
						.equals(input.getMemberRepass().trim())) {
			result.inErrorMessage(965305003);
		}

		if (result.upFlagTrue()) {

			String sMemberCode = WebHelper.upCode("MI");
			DbUp.upTable("mc_member_info").insert("member_code", sMemberCode,
					"member_email", input.getMemberEmail().trim(),
					"member_phone", input.getMemberPhone().trim(),
					"member_pass",
					SecrurityHelper.MD5(input.getMemberPassword().trim()),
					"create_time", FormatHelper.upDateTime());

			String sAccessToken = new OauthSupport().insertOauth(sMemberCode,
					"", input.getMemberEmail().trim(), "30d", "");

			result.setMemberName(input.getMemberEmail().trim());
			result.setAccessToken(sAccessToken);

		}

		return result;
	}

	public MemberResult memberLogin(MemberLoginInput input) {
		MemberResult result = new MemberResult();

		if (result.upFlagTrue() && (StringUtils.isBlank(input.getLoginName()))) {
			result.inErrorMessage(965305008);
		}

		MDataMap mMemberMap = DbUp.upTable("mc_member_info").oneWhere("", "",
				"member_email=:login_name or member_phone=:login_name",
				"login_name", input.getLoginName().trim());

		if (result.upFlagTrue() && (mMemberMap == null || mMemberMap.isEmpty())) {
			result.inErrorMessage(965305004);
		}

		if (result.upFlagTrue()
				&& !StringUtils.equals(mMemberMap.get("flag_enable"), "1")) {
			result.inErrorMessage(965305005);
		}
		int lFaield = 0;
		if (result.upFlagTrue()) {

			lFaield = Integer.parseInt(mMemberMap.get("failed_count"));

			// 判断最大失败次数
			if (lFaield >= WebConst.CONST_USER_FAIL_TIME) {

				// 开始判断最大失败次数
				try {

					Date dFailDate = DateUtils.addMinutes(FormatHelper
							.parseDate(mMemberMap.get("failed_time")),
							WebConst.CONST_USER_FAIL_LOCK_MINUTE);

					if (dFailDate.after(new Date())) {

						// 判断当前时间差
						int iDiffMinute = (int) (Math
								.ceil((dFailDate.getTime() - (new Date())
										.getTime())) / (1000 * 60));

						result.inErrorMessage(965305006, String
								.valueOf((iDiffMinute > 0 ? iDiffMinute : 1)));

					} else {
						lFaield = 0;
					}

				} catch (Exception e) {
					e.printStackTrace();
					result.inErrorMessage(965305006,
							WebConst.CONST_USER_FAIL_LOCK_MINUTE);
				}
			}

		}

		if (result.upFlagTrue()) {

			// 判断如果密码不对则
			if (!SecrurityHelper.MD5(input.getLoginPassword().trim())
					.equalsIgnoreCase(mMemberMap.get("member_pass").trim())) {
				// 如果密码不对时 增加冻结次数
				mMemberMap.put("failed_count", String.valueOf(lFaield + 1));

				mMemberMap.put("failed_time", FormatHelper.upDateTime());

				DbUp.upTable("mc_member_info").dataUpdate(mMemberMap,
						"failed_count,failed_time", "zid");
				result.inErrorMessage(965305007);

			}

		}

		if (result.upFlagTrue()) {

			mMemberMap.put("last_time", FormatHelper.upDateTime());
			mMemberMap.put("failed_count", "0");
			mMemberMap.put("failed_time", "");

			DbUp.upTable("mc_member_info").dataUpdate(mMemberMap,
					"failed_count,failed_time,last_time", "zid");

		}

		if (result.upFlagTrue()) {
			String sAccessToken = new OauthSupport().insertOauth(mMemberMap
					.get("member_code"), "", input.getLoginName().trim(),
					"30d", "");

			result.setMemberName(input.getLoginName().trim());
			result.setAccessToken(sAccessToken);
		}

		return result;
	}

	public MWebResult userPass(UserPassInput input, String sMemebrCode) {
		MWebResult result = new MWebResult();
		if (result.upFlagTrue()) {

			if (!StringUtils.equals(input.getNewPass(), input.getRepPass())) {
				result.inErrorMessage(965305003);
			}
		}
		if (result.upFlagTrue()) {

			MDataMap mMemberMap = DbUp.upTable("mc_member_info").one(
					"member_code", sMemebrCode);

			if (StringUtils.equals(SecrurityHelper.MD5(input.getOldPass()),
					mMemberMap.get("member_pass"))) {

				mMemberMap.inAllValues("member_pass",
						SecrurityHelper.MD5(input.getNewPass()));
				DbUp.upTable("mc_member_info").dataUpdate(mMemberMap,
						"member_pass", "zid");

			} else {
				result.inErrorMessage(965305007);
			}

		}

		return result;

	}

	public MWebResult userInfo(UserInfoInput input, String sMemebrCode) {

		MWebResult result = new MWebResult();

		if (result.upFlagTrue()) {

			if (StringUtils.isNotBlank(input.getMemberPhone())) {

				MDataMap mPhoneMember = DbUp.upTable("mc_member_info").one(
						"member_phone", input.getMemberPhone().trim());
				if (mPhoneMember != null
						&& !StringUtils.equals(mPhoneMember.get("member_code"),
								sMemebrCode)) {

					result.inErrorMessage(965305002);
				}

			}

		}

		if (result.upFlagTrue()) {
			MDataMap mDataMap = new MDataMap("member_phone", input
					.getMemberPhone().trim(), "real_name", input.getRealName(),
					"member_code", sMemebrCode);

			DbUp.upTable("mc_member_info").dataUpdate(mDataMap,
					"member_phone,real_name", "member_code");
		}

		return result;

	}

	/**
	 * 忘记密码
	 * 
	 * @param input
	 * @return
	 */
	public MWebResult memberForget(MemberForgetInput input) {

		MWebResult result = new MWebResult();

		MDataMap mDataMap = DbUp.upTable("mc_member_info").one("member_email",
				input.getMemberEmail());

		if (result.upFlagTrue() && !(mDataMap != null && mDataMap.size() > 0)) {

			result.inErrorMessage(965305009);
		}

		if (result.upFlagTrue()) {

			String sResetToken = new Date().getTime() + "-"
					+ WebHelper.upUuid();

			mDataMap.inAllValues("reset_token", sResetToken);
			DbUp.upTable("mc_member_info").dataUpdate(mDataMap, "reset_token",
					"zid");

			new MailSupport().sendMail(
					mDataMap.get("member_email"),
					bInfo(965305010),
					bInfo(965305011,
							StringUtils.substringBeforeLast(
									input.getResetTarget(), "/")
									+ "/member_reset?u_code=" + sResetToken));

		}

		return result;
	}

	public MWebResult memberReset(MemberResetInput input) {
		MWebResult result = new MWebResult();

		if (result.upFlagTrue()) {
			long lTime = Long.parseLong(StringUtils.substringBefore(
					input.getResetToken(), "-"));

			long lNow = new Date().getTime();

			// 判断时间差需要在一天以内
			if (Math.abs(lNow - lTime) > 1000 * 3600 * 24) {
				result.inErrorMessage(965305012);
			}

		}

		if (result.upFlagTrue()) {
			if (!StringUtils.equals(input.getPassword(), input.getRepass())) {
				result.inErrorMessage(965305003);
			}
		}

		if (result.upFlagTrue()) {

			MDataMap mDataMap = DbUp.upTable("mc_member_info").one(
					"reset_token", input.getResetToken());

			if (mDataMap != null && mDataMap.size() > 0) {
				mDataMap.inAllValues("reset_token", "", "member_pass",
						SecrurityHelper.MD5(input.getPassword()));

				DbUp.upTable("mc_member_info").dataUpdate(mDataMap,
						"reset_token,member_pass", "zid");
			} else {
				result.inErrorMessage(965305012);
			}

		}

		return result;
	}
}
