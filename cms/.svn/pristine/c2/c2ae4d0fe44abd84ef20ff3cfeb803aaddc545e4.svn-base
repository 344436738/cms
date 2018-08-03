package com.leimingtech.cms.service.impl.content;

import com.leimingtech.cms.service.statictemplate.IStatic;
import com.leimingtech.common.ContextHolderUtils;
import com.leimingtech.core.common.CmsConstants;
import com.leimingtech.core.common.ContentStatus;
import com.leimingtech.base.entity.temp.*;
import com.leimingtech.core.service.ConstantsServiceI;
import com.leimingtech.core.service.ContentsServiceI;
import com.leimingtech.core.service.WorkFlowServiceI;
import com.leimingtech.core.service.impl.CommonServiceImpl;
import com.leimingtech.core.util.*;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service("constantsService")
@Transactional
public class ConstantsServiceImpl extends CommonServiceImpl implements ConstantsServiceI{

	@Autowired
	private IStatic staticImpl;
	@Autowired
	private ContentsServiceI contentsService;
	@Autowired
	private WorkFlowServiceI workFlowService;
	
	/**
	 * 是否有工作流
	 * @param contents
	 */
	@Override
	public void isWorkFlow(ContentsEntity contents,ContentCatEntity contentcat) {
		//发布(非草稿)
		if("0".equals(contents.getConstants())){
			//没有工作流
			if("0".equals(contentcat.getWorkflowid())){
				toPublished(contents, contentcat);
			}else{
				enterworkflow(contents, contentcat);
			}
			saveOrUpdate(contents);
		}
		if(ContentStatus.CONTENT_PUBLISHED.equals(contents.getConstants())){
			try {
				staticImpl.staticContent(UserUtils.getSite(), contentcat.getId(), contents.getId());
				encode(contents.getId());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 是否到发布时间
	 * @param contents
	 * @param contentcat
	 */
	public void toPublished(ContentsEntity contents,ContentCatEntity contentcat){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			if(contents.getPublished()==null||sdf.format(new Date()).equals(sdf.format(contents.getPublished()))
					||sdf.parse(sdf.format(new Date())).compareTo(sdf.parse(sdf.format(contents.getPublished())))==1){
				downContent(contents.getId().toString(),ContentStatus.CONTENT_PUBLISHED);//已发
					contents.setPublished(new Date());//发布时间
					staticImpl.staticContent(UserUtils.getSite(), contentcat.getId(), contents.getId());
					encode(contents.getId());
					//创建链接内容
					if(StringUtils.isNotEmpty(contents.getSynCatid())){
						contentsService.saveLinkContent(contents,contents.getSynCatid());
					}
			}else{
				downContent(contents.getId().toString(),ContentStatus.CONTENT_COMMITTED);//待发
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 工作流
	 * @param contents
	 * @param concat
	 */
	public void enterworkflow(ContentsEntity contents, ContentCatEntity concat) {
		// 工作流开始
		WorkflowAuditingEntity audit = workFlowService.enterWorkFlow(concat.getWorkflowid()+"", contents.getId()+"", 1);// type=1是内容
		if (audit != null) {
			contents.setWorkflowRoleid(audit.getAuditingrole());
			contents.setWorkflowStep(audit.getStep());
			contents.setStatus(ContentStatus.WORKFLOW_PENDING_TRIAL);// 工作流20为待审
			downContent(contents.getId().toString(),ContentStatus.CONTENT_PENDING_TRIAL);//文章状态待审
		} else {
			contents.setStatus(ContentStatus.WORKFLOW_YET_AUDIT);//30为已审
			//为已审的内容判断是否到发布时间发布
			toPublished(contents, concat);
		}
		// 工作流结束
	}

	/**
	 * 工作流内容送审
	 * @param ids
	 * @return
	 */
	@Override
	public String songshen(String ids,String token) {
		
		String[] contentsids = ids.split(",");
		//当前用户所拥有的权限
		List<TSRole> roleList = PlatFormUtil.getRoleUser();
		
		String message = "审核通过";
		for (String contentsid : contentsids) {
			ContentsEntity contents = get(ContentsEntity.class, String.valueOf(contentsid));
			ContentCatEntity concat = getEntity(ContentCatEntity.class, contents.getCatid());
			//0表示送审、1表示发布（工作流有无区分）
			if("0".equals(token)){
				//判断是有有审核的权限
				if(concat.getWorkflowid()!=null){
					WorkflowAuditingEntity audit = workFlowService.enterWorkFlow(concat.getWorkflowid()+"", contents.getId()+"", 1);//type=1是内容
					if(audit!=null){
						contents.setWorkflowRoleid(audit.getAuditingrole());
						contents.setWorkflowStep(audit.getStep());
						contents.setStatus(ContentStatus.WORKFLOW_PENDING_TRIAL);//20为待审
						downContent(contents.getId().toString(),ContentStatus.CONTENT_PENDING_TRIAL);
						message = "送审成功";
					}else{
						contents.setStatus(ContentStatus.WORKFLOW_YET_AUDIT);//30为已审
						//为已审的内容判断是否到发布时间发布
						toPublished(contents, concat);
					}
				}else{
					contents.setStatus(ContentStatus.WORKFLOW_YET_AUDIT);//30为已审
					//为已审的内容判断是否到发布时间发布
					toPublished(contents, concat);
				}
			saveOrUpdate(contents);
			//没有工作流点击发布直接进入发布状态
			}else if("1".equals(token)){
//				toPublished(contents, connect);
				try {
					downContent(contents.getId().toString(),ContentStatus.CONTENT_PUBLISHED);//已发
					if(org.apache.commons.lang3.StringUtils.isEmpty(contents.getPublishedby())){
						contents.setPublished(new Date());//发布时间
						contents.setPublishedby(UserUtils.getUser().getUserName());//发布人
					}
					staticImpl.staticContent(UserUtils.getSite(), concat.getId(), contents.getId());
					//创建链接内容
//					if(StringUtil.isNotEmpty(contents.getSynCatid())){
//						contentsService.saveLinkContent(contents,contents.getSynCatid());
//					}
					encode(contents.getId());
					message = "发布成功";
				} catch (Exception e) {
					e.printStackTrace();
					message = "发布失败";
				}
			}
		}
		return message;
	}
	/**
	 * 生成内容二维码
	 * @param contents
	 * @throws Exception 
	 */
	public void encode(String contentId) throws Exception{
//		HttpServletRequest request = ContextHolderUtils.getRequest();
//		String ip = oConvertUtils.getIp();//192.168.1.100
//		String deal = request.getScheme();//http
//		ContentsEntity contents = get(ContentsEntity.class, contentId);
//		String fileNamePath = CmsConstants.getUploadFilesPath(UserUtils.getSiteId())+"/upload/twocode/";
//		String fileDir = StringUtils.substringBeforeLast(fileNamePath, "/");
//		org.apache.commons.io.FileUtils.forceMkdir(new File(fileDir + "/"));
//		String title = contents.getTitle();
//		title = title.replace("\n", "");
//		String imgPath = fileNamePath+title+"_"+contents.getId()+".png";
//		contents.setTwoCode("/upload/twocode/"+title+"_"+contents.getId()+".png");
//		saveOrUpdate(contents);
//        String encoderContent = deal+"://"+ip+contents.getUrl();
//        TwoDimensionCode handler = new TwoDimensionCode();
//        handler.encoderQRCode(encoderContent, imgPath, "png");
//       String decoderContent = handler.decoderQRCode(imgPath);
//        System.out.println("解析结果如下：");
//       System.out.println(decoderContent);
	}
	/**
	 * 工作流审核
	 * @param ids
	 * @param result
	 * @return
	 */
	@Override
	public String contentsAudit(String ids, String result) {
		TSUser user = UserUtils.getUser();
//		String[] contentsids = ids.split(",");
		String message = "";
		//当前用户所拥有的权限
		List<TSRole> roleList = PlatFormUtil.getRoleUser();
//		for (String contentsid : contentsids) {
			ContentsEntity cont = get(ContentsEntity.class, String.valueOf(ids));
			ContentCatEntity contentCat = get(ContentCatEntity.class, cont.getCatid());
			boolean token = workFlowService.judge(cont.getId()+"", roleList);
			//判断是有有审核的权限
			if(token){
				boolean flag = workFlowService.Audit(user, Integer.valueOf(result), null, ids+"", 1);
				if(flag){
					message = "审核通过";
					if(!"0".equals(result)){
						WorkflowAuditingEntity audit = workFlowService.getCurrAudit(ids+"", 1);
						if(audit!=null){
							cont.setWorkflowRoleid(audit.getAuditingrole());
							cont.setWorkflowStep(audit.getStep());
							cont.setStatus(ContentStatus.WORKFLOW_PENDING_TRIAL);
						}else{
							cont.setStatus(ContentStatus.WORKFLOW_YET_AUDIT);
							//为已审的内容判断是否到发布时间发布
							toPublished(cont, contentCat);
						}
					}else{
						cont.setStatus(ContentStatus.WORKFLOW_REFUSE);
						message = "审核未通过";
						downContent(cont.getId().toString(), ContentStatus.CONTENT_BACK_MANUSCRIPT);//文章状态-退稿
					}
					saveOrUpdate(cont);
				}else{
					message = "请等待上一步审核通过";
				}
			}else{
				message = "您没有审核该记录的权限";
			}
//		}
		
		return message;
	}

	/**
	 * 下线、回收站
	 * @param result
	 * @return
	 */
	@Override
	public String downContent(String contentsId,String result) {
		JSONObject j = new JSONObject();
		String message = "修改成功";
		String[] ids = contentsId.split(",");
		for(String id:ids){
			ContentsEntity content = get(ContentsEntity.class,String.valueOf(id));
			//回收站
			if(result.equals("-1")){
				content.setConstants("70");
				message = "删除成功，可进入回收站还原";
				//还原
			}else if(result.equals("1")){
				content.setConstants("10");
				content.setStatus("");
				message = "还原成功";
			}else{
				content.setConstants(result);
			}
			saveOrUpdate(content);
		}
		return message;
	}

	public String firstStep(ContentCatEntity contentCat,List<TSRole> roleList){
		String str = "";
		if(null!=contentCat){
			
			for(TSRole role:roleList){
				String hql = " from WorkFlowStepEntity where roleid='"+role.getId()+"' and gid='"+contentCat.getWorkflowid()+"'";
				List<WorkFlowStepEntity> stepList = findByQueryString(hql);
				if(stepList.size()>0){
					WorkFlowStepEntity flowStep = stepList.get(0);
					str += flowStep.getStep()+",";
				}
			}
		}
		return str;
	}
	
	public boolean isFun(TSUser user,Integer type){
		boolean flag = false;
		String hql = "from WorkflowAuditingEntity where type="+type+" and auditingresult is null and (delflag!=-1 or delflag is null) order by step asc";
		List<WorkflowAuditingEntity> auditList = this.findByQueryString(hql);
		if(auditList.size()>0){
			WorkflowAuditingEntity audit = auditList.get(0);
			List<TSRoleUser> rUsers = this.findByProperty(TSRoleUser.class, "TSUser.id", user.getId());
			for (TSRoleUser tsRoleUser : rUsers) {
				if(tsRoleUser.getTSRole().getId().equals(audit.getAuditingrole())){
					flag = true;
				}
			}
		}
		return flag;
	}

	 
}
