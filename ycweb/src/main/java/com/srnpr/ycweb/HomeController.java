package com.srnpr.ycweb;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.srnpr.zapweb.websupport.ImageSupport;
import com.srnpr.zapcom.basehelper.FormatHelper;
import com.srnpr.zapcom.basemodel.MDataMap;
import com.srnpr.zapcom.basesupport.WebClientSupport;
import com.srnpr.zapdata.dbdo.DbUp;
import com.srnpr.zapweb.helper.WebSessionHelper;
import com.srnpr.zapweb.webmethod.RootControl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController extends RootControl {

	@RequestMapping(value = "/extend/image", produces = { "application/binary;charset=UTF-8" })
	@ResponseBody
	public String extendImage(HttpServletRequest request, HttpServletResponse response) {

		try {
			String sText = new ImageSupport().getCertPic(130, 40, 4, response.getOutputStream());
			
			
			String sUqCode = request.getParameter("u_uqcode");

			if (DbUp.upTable("mc_verify_code").count("uqcode", sUqCode) == 0) {
				DbUp.upTable("mc_verify_code").insert("uqcode", sUqCode, "verify_code", sText, "create_time",
						FormatHelper.upDateTime());
			} else {
				DbUp.upTable("mc_verify_code").dataUpdate(new MDataMap("uqcode", sUqCode, "verify_code", sText),
						"verify_code", "uqcode");
			}
			

			// 禁止图像缓存。
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);

			response.setContentType("image/jpeg");

			

			

			response.getOutputStream().flush();

			response.getOutputStream().close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

		}

		return null;

	}

}
