package com.leimingtech.cms.controller.presstime;

import com.leimingtech.base.entity.site.SiteEntity;
import com.leimingtech.base.entity.temp.AttachPictureEntity;
import com.leimingtech.base.entity.temp.ContentCatVOTreeEntity;
import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.cms.json.AjaxJson;
import com.leimingtech.core.common.ContentStatus;
import com.leimingtech.core.controller.BaseController;
import com.leimingtech.core.service.CommonService;
import com.leimingtech.core.service.ContentCatServiceI;
import com.leimingtech.core.util.ResourceUtil;
import com.leimingtech.core.util.StringUtils;
import com.leimingtech.core.util.TemplateExcelUtil;
import com.leimingtech.core.util.UserUtils;
import com.leimingtech.common.utils.date.DateUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**   
 * @Title: Controller
 * @Description: 发稿量统计
 * @author syx 2017-4-17 15:15:43
 * @date
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/pressTimeController")
public class PressTimeController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(PressTimeController.class);

	@Autowired
	private CommonService commonService;
	@Autowired
	private ContentCatServiceI contentCatService;
	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * 发稿量统计
	 * 
	 * @param
	 * @param
	 * @param
	 * @param
	 */
	@RequestMapping(params = "pressTime")
	public ModelAndView pressTime(AttachPictureEntity attachPicture, HttpServletRequest request) {

		String siteId=request.getParameter("siteId"); //站点Id

		if(StringUtils.isEmpty(siteId)){
			siteId=UserUtils.getSiteId();
		}
		String pressYear=request.getParameter("pressYear");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		if(StringUtils.isEmpty(pressYear)){
			pressYear=DateUtils.format(new Date(),"yyyy");
		}

		String fristYear=DateUtils.format(new Date(),"yyyy");
		String lastYear=DateUtils.format(new Date(),"yyyy");
		//最早年
		List<ContentsEntity> contentList=commonService.findObjForJdbc("SELECT created FROM `cms_content` WHERE site_id='"+siteId+"' ORDER BY created ",1,1,ContentsEntity.class);
		if(contentList!=null && contentList.size()>0){
			 fristYear=DateUtils.format(contentList.get(0).getCreated(),"yyyy");
		}
		List<String> yearList =new ArrayList<String>();
		for(int i=(Integer.parseInt(lastYear)-Integer.parseInt(fristYear));i>=0;i--){
			yearList.add(String.valueOf(Integer.parseInt(fristYear)+i));
		}


		Map<String,Object> map=getCatList(siteId,pressYear);

		List<SiteEntity> siteList=commonService.getList(SiteEntity.class);  //站点列表

		Map<String, Object> m = new HashMap<String, Object>();

		m.put("siteId", siteId);
		m.put("siteList", siteList);
		m.put("catList", map.get("catList"));
		m.put("allCount", map.get("allCount"));
		m.put("pressYear", pressYear);
		m.put("yearList", yearList);
		return new ModelAndView("cms/presstime/pressTimeList", m);
	}

	/**
	 * 获取一级栏目发稿量
	 * @param siteId
	 * @return
     */
	public  Map<String,Object> getCatList(String siteId,String pressYear){
		List<Map<String,Object>> catList=new ArrayList<Map<String,Object>>();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		List<ContentCatVOTreeEntity> firstCatList=contentCatService.getFirstCatList(siteId);  //一级栏目
		int allCount=0;
		if(firstCatList!=null && firstCatList.size()>0){
			for(int i=0;i<firstCatList.size();i++){
				Map<String,Object> catMap=new HashMap<String, Object>();
				Criteria criteria = commonService.getSession().createCriteria(ContentsEntity.class);
				criteria.add(Restrictions.like("pathids", "%"+"0,"+firstCatList.get(i).getId()+","+"%"));
				criteria.add(Restrictions.eq("constants", ContentStatus.CONTENT_PUBLISHED));  //已发
				try {
					criteria.add(Restrictions.between("created",sdf.parse(pressYear+"-01-01 00:00:00"),sdf.parse(pressYear+"-12-31 23:59:59")));
				}catch (ParseException e) {
				   e.printStackTrace();
			   }

				int counts = ((Long) criteria.setProjection(Projections.rowCount())   //发稿量
						.uniqueResult()).intValue();   //一级栏目下所有的数量(包含一级栏目)
				catMap.put("catName",firstCatList.get(i).getName());
				catMap.put("catCount",counts);
				catList.add(catMap);
				allCount+=counts;
			}
		}
		Map<String,Object> m =new HashMap<String,Object>();
		m.put("allCount",allCount);
		m.put("catList",catList);
		return m;
	}


	/**
	 * 导出excel
	 *
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportExcels")
	@ResponseBody
	public AjaxJson exportXls(HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();

		String siteId=request.getParameter("siteId"); //站点Id

		if(StringUtils.isEmpty(siteId)){
			siteId=UserUtils.getSiteId();
		}
		String pressYear=request.getParameter("pressYear");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		if(StringUtils.isEmpty(pressYear)){
			pressYear=DateUtils.format(new Date(),"yyyy");
		}
		Map<String,Object> map=getCatList(siteId,pressYear);


		List<Map<String, Object>> catList=(List<Map<String, Object>>)map.get("catList");  //一级栏目
		SiteEntity site=commonService.get(SiteEntity.class,siteId);


		//使用excel导出流量报表
		TemplateExcelUtil excelUtil = new TemplateExcelUtil();
		// 流量报表excel模板在类包中，转为流给excelutil
		Workbook wb=excelUtil.openModals("excel/presstime/preeTimeYear.xlsx");

		writeStringToCell(wb,0, 0, pressYear+"年"+site.getSiteName()+"各栏目发稿量",true,false); // 标题

		int i = 2;
		for(Map<String,Object> m : catList){
			writeStringToCell(wb,i, 0, m.get("catName").toString(),false,false); // 一级栏目
			writeStringToCell(wb,i, 1, m.get("catCount").toString(),false,false); // 发稿量
			i++;
		}
		writeStringToCell(wb,i, 0, "发稿总量",true,true); //
		writeStringToCell(wb,i, 1, map.get("allCount").toString(),false,true); // 年度总发稿量

		// saas 版导出目录用户上下文目录access文件夹
		String filename = "";
		String codedFileName = pressYear+"年"+site.getSiteName()+"发稿量";
		File file = new File(ResourceUtil.getSysPath()+"\\temp\\"+filename);
		if (!file.exists()){
			file.mkdirs();
		}
		SimpleDateFormat t = new SimpleDateFormat("yyyyMMddHHmmss");
		try {
			filename = codedFileName+"-"+t.format(new Date())+ ".xlsx";
			excelUtil.writeToFile(ResourceUtil.getSysPath()+"\\temp\\" + filename);//写
			message = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/temp/" + filename;
		} catch (Exception e) {
			e.printStackTrace();
			message="";
		}
		j.setMsg(message);
		return j;
	}

	//给单元格加样式
	//Font 字体
	//加背景色
	public void writeStringToCell(Workbook wb,int numRow, int numCol, String strval,boolean isFont,boolean backColor){
		try{
			strval = StringUtils.isEmpty(strval)?"":strval;
			if (wb.getSheetAt(0)!=null){
				Sheet aSheet = wb.getSheetAt(0);
				Row row =aSheet.getRow((short) numRow);
				if(row==null)
					row = aSheet.createRow(numRow);
				CellStyle style =wb.createCellStyle();
				style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直
				style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 水平
				if(backColor){   //设置背景色
					style.setFillForegroundColor(HSSFColor.AQUA.index);
				}
				if(isFont){   //字体加粗
					Font font=wb.createFont();
					font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);   //加粗
					style.setFont(font);
				}
				Cell csCell = row.getCell((short)numCol);
				if(csCell==null)
					csCell = row.createCell(numCol);
				//csCell.setEncoding(HSSFCell.ENCODING_UTF_16);
				csCell.setCellValue(strval);
				csCell.setCellStyle(style);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
