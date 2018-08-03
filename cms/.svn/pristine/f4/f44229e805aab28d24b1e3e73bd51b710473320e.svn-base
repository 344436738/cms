package com.leimingtech.cms.service.impl.content;

import com.leimingtech.base.entity.temp.ContentsEntity;
import com.leimingtech.cms.service.statictemplate.IStatic;
import com.leimingtech.common.ContextHolderUtils;
import com.leimingtech.common.Globals;
import com.leimingtech.base.entity.temp.ContentCatEntity;

import com.leimingtech.base.entity.temp.VoteEntity;
import com.leimingtech.base.entity.temp.VoteOptionEntity;
import com.leimingtech.core.service.*;
import com.leimingtech.core.service.impl.CommonServiceImpl;
import com.leimingtech.core.util.MyBeanUtils;
import com.leimingtech.core.util.StringUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Service("voteService")
@Transactional
public class VoteServiceImpl extends CommonServiceImpl implements VoteServiceI {
	@Autowired
	private SystemService systemService;
	@Autowired
	private ConstantsServiceI constantsService;
	@Autowired
	private ContentsServiceI contentsService;
	@Autowired
	private IStatic staticImpl;
	@Autowired
	private VoteOptionServiceI voteOptionService;//投票选项
	@Override
	public void saveVote(ContentsEntity contents, VoteEntity vote) {
		HttpServletRequest request = ContextHolderUtils.getRequest();
		//栏目id
		String contentCatId = request.getParameter("contentCatId");
		//获取当前毫秒数
		String temporary = request.getParameter("temporary");
		//顺序值
		String divValue = request.getParameter("divValue");
		ContentCatEntity contentcat=getEntity(ContentCatEntity.class, contentCatId);
		String message = "";
		if (StringUtils.isNotEmpty(vote.getId())){
			//修改投票
			updateVote(contents, vote, contentcat, temporary, divValue);
		}else{
			//添加投票
			message = "投票["+contents.getTitle()+"]添加成功";
			vote.setContentid(contents.getId());
			vote.setSiteid(contents.getSiteid());
			vote.setCreatedtime(new Date());//创建时间
			save(vote);
			//保存投票选项
			saveVoteOption(vote);
			//在modelExt中保存modelId/attrName
			contentsService.saveModelItem(contents);
			//保存相关内容
			contentsService.saveRelateContent(contents, temporary, divValue);
			//生成预览页面
			staticImpl.staticContentActOnPreview(contents);
			//进入判断工作流和状态
			constantsService.isWorkFlow(contents, contentcat);
			//日志添加
			systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_INSERT);
		}
	}
	
	/**
	 * 保存投票选项
	 * 
	 * @param vote
	 */
	private void saveVoteOption(VoteEntity vote) {
		List<VoteOptionEntity> voteOptionList = new ArrayList<VoteOptionEntity>();

		voteOptionList = findByProperty(VoteOptionEntity.class, "voteid",
				vote.getId()+"");

		HttpServletRequest request = ContextHolderUtils.getRequest();

		String[] voteoptionId = request.getParameterValues("voteoptionId");// 选项id
		String[] optionname = request.getParameterValues("optionname");// 选项名
		String[] optionimg = request.getParameterValues("optionimg");// 选项图片
		String[] optiontotal = request.getParameterValues("optiontotal");// 初始票数

		Set<Integer> indexSet = new HashSet<Integer>();// 存放已经修改过的投票选项

		if (voteOptionList != null && voteOptionList.size() > 0) {
			for (VoteOptionEntity voteOption : voteOptionList) {
				if (!ArrayUtils
						.contains(voteoptionId, voteOption.getId())) {
					voteOptionService.delete(voteOption);
				} else {
					VoteOptionEntity vp = new VoteOptionEntity();
					int index = ArrayUtils.indexOf(voteoptionId,
							voteOption.getId());

					vp.setOptionimg(optionimg[index]);
					vp.setOptionname(optionname[index]);

					if (StringUtils.isNumeric(optiontotal[index])) {
						vp.setOptiontotal(Integer.valueOf(optiontotal[index]));
					}

					indexSet.add(index);
					try {
						MyBeanUtils.copyBeanNotNull2Bean(vp, voteOption);
						voteOptionService.saveOrUpdate(voteOption);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}

		// 保存新增的投票选项
		for (int i = 0; i < optiontotal.length; i++) {
			if (indexSet.contains(i)) {
				continue;
			}
			VoteOptionEntity vp = new VoteOptionEntity();
			vp.setOptionimg(optionimg[i]);
			vp.setOptionname(optionname[i]);
			if (StringUtils.isNumeric(optiontotal[i])) {
				vp.setOptiontotal(Integer.valueOf(optiontotal[i]));
			}

			vp.setVoteid(vote.getId() + "");
			vp.setSiteid(vote.getSiteid());
			voteOptionService.save(vp);
		}

	}
	
	@Override
	public void updateVote(ContentsEntity contents, VoteEntity vote,ContentCatEntity contentcat, String temporary, String divValue) {
		String message = "";
		try {
			message = "投票["+contents.getTitle()+"]更新成功";
			VoteEntity t = get(VoteEntity.class, vote.getId());
			MyBeanUtils.copyBeanNotNull2Bean(vote, t);
			
			if(vote.getMaxvotes()==null){
				t.setMaxvotes(null);
			}
			
			saveOrUpdate(t);
			//保存投票选项
			saveVoteOption(t);
			//保存扩展参数名称和value
			contentsService.saveModelExt(contents);
			//保存相关内容
			contentsService.saveRelateContent(contents, temporary, divValue);
			staticImpl.staticContentActOnPreview(contents);
			//进入判断工作流和状态
			constantsService.isWorkFlow(contents, contentcat);
			//日志添加
			systemService.addLog(message, Globals.Log_Leavel_INFO, Globals.Log_Type_UPDATE);
		} catch (Exception e) {
			e.printStackTrace();
			message = "投票["+contents.getTitle()+"]更新失败";
		}
	}
	
}