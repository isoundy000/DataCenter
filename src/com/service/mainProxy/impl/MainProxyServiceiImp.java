package com.service.mainProxy.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.mainProxy.MainProxyDao;
import com.dictionary.ErrorDictionary;
import com.pojo.Customer;
import com.pojo.MainProxy;
import com.pojo.Proxy;
import com.service.customer.CustomerService;
import com.service.mainProxy.MainProxyService;
import com.service.proxy.ProxyService;


@Service
public class MainProxyServiceiImp implements MainProxyService{
	/*	@Autowired
	@Qualifier("userDao")*/
	@Autowired
	public MainProxyDao mainProxyDao;
	@Autowired
	ProxyService proxyService;
	@Autowired
	CustomerService customerService;


	@Override
	public MainProxy getyMainProxyById(int id) {

		return mainProxyDao.getUserByid(id);
	}
	//待会删除
	@Transactional(rollbackFor=RuntimeException.class)
	public void add(MainProxy user) {
		// TODO Auto-generated method stub
		//	userDao.add(user);
		//throw new RuntimeException("运行期例外"); 

	}

	@Override
	public String addUser(MainProxy user) {
		StringBuffer stringBuffer=new StringBuffer();
		for (int i = 0; i < 7; i++) {
			stringBuffer.append((int)(Math.random()*10));	
		}
		user.setPassword(stringBuffer.toString());
		int result=mainProxyDao.addUser(user);
		if (result==1) {
			return "添加成功";
		}else{
			return "添加失败";
		}
	}

	/*	@Override
	@Transactional
	public int updateCardCount(MainProxy user,String edUserId,int type,int count) {
		MainProxy edUser=QueryUserById(edUserId);
		edUser.setCardFCount(edUser.getCardLCount()-count);
		int result=-1;
		if (type==1) {
			result=mainProxyDao.updateCardLCount(edUser);
			if (result==1) {
				user.setCardLCount(user.getCardLCount()-count);
				return 1;
			}else{
				return -1;
			}
		}
		else{
			result=mainProxyDao.updateCardFCount(edUser);
			if (result==1) {
				user.setCardFCount(user.getCardFCount()-count);
				return 1;
			}else{
				return -1;
			}
		}

	}*/
	@Override
	public List<MainProxy> getMainProxys(int startIndex,int length) {
		return mainProxyDao.getMainProxys(startIndex,length);
	}
	@Override
	public int getMainProxysCount() {
		return mainProxyDao.getMainProxysCount();
	}
	/**
	 * 处理总代的赠送和销售操作
	 * toType :0售卡给代理，1售卡给玩家,2给总代
	 */

	@Override
	public int sellCardCount(int userId, int edUserId, int type, int toType, int count,int income) {
		int result=-1;
		MainProxy mainProxy=mainProxyDao.getUserByid(userId);
		Date cardLTime=mainProxy.getCardLTime();
		Date preProxyDate=null;
		Proxy edProxy=proxyService.findProxyByID(edUserId);
		if (toType==0) {//售卡给代理，处理代理的数据
			preProxyDate=edProxy.getCardLTime();
			//总代给代理充卡
			result=proxyService.updateCardCount(userId,edProxy.getUsername(),edUserId,type,count,cardLTime);
			/*if (result>0){
				proxyService.handleThreeClassBonus(edUserId,count);
			}*/
		}else if (toType==1) {//售卡给玩家，处理玩家的数据
			//****************总代给玩家售卡，屏蔽筛选规则********************
//			Customer edCustommer=customerService.QueryCustomerById(edUserId);
//			if(edCustommer.getRecommendUid()!=0&&edCustommer.getRecommendUid()!=userId){
//				return ErrorDictionary.you_are_not_recommender.getValue();	
//			}
			//****************总代给玩家售卡，屏蔽筛选规则********************
			result=customerService.updateCardCount(edUserId,count);
		}else if (toType==2) {//售卡给总代，处理总代的数据
			//****************总代给玩家售卡，屏蔽筛选规则********************
//			Customer edCustommer=customerService.QueryCustomerById(edUserId);
//			if(edCustommer.getRecommendUid()!=0&&edCustommer.getRecommendUid()!=userId){
//				return ErrorDictionary.you_are_not_recommender.getValue();	
//			}
			//****************总代给玩家售卡，屏蔽筛选规则********************
			result=updateCardCount(edUserId, type, count,cardLTime);
		}
		if(result>0){
			//赠送成功的情况下，修改自身数据
			if (type==0) {
				mainProxy.addIncome(income);
				mainProxy.setCardFCount(mainProxy.getCardFCount()-count);
				result=mainProxyDao.updateCardFCount(mainProxy);
			}else if (type==1) {
				mainProxy.setCardLCount(mainProxy.getCardLCount()-count);
				result=mainProxyDao.updateCardLCount(mainProxy);	
			}
		}
		//更新自己数据失败，还原之前操作
		if (result<=0) {
			if (toType==0) {//售卡给代理，处理代理的数据
				result=proxyService.updateCardCount(userId,mainProxy.getUsername(),edUserId,type,-count,preProxyDate);
			}else if (toType==1) {//售卡给玩家，处理玩家的数据
				result=customerService.updateCardCount(edUserId,-count);
			}
		}
		return result;
	}
	/**
	 * 管理员售卡给总代，处理
	 */
	@Override
	public int updateCardCount(int mainProxyId, int sellType, int count,Date cardLTime) {
		MainProxy mainProxy=mainProxyDao.getUserByid(mainProxyId);
		int result=-1;

		if (sellType==0) {
			mainProxy.setCardFCount(mainProxy.getCardFCount()+count);
			result=mainProxyDao.updateCardFCount(mainProxy);
		}else if (sellType==1) {
			mainProxy.setCardLTime(cardLTime);
			mainProxy.setCardLCount(mainProxy.getCardLCount()+count);
			result=mainProxyDao.updateCardLCount(mainProxy);	
		}
		return result;
	}
	@Override
	public int editPassword(MainProxy person) {
		// TODO Auto-generated method stub
		return mainProxyDao.editPassword(person);
	}
	@Override
	public List<MainProxy> getPersonLikeUsername(String username) {
		return mainProxyDao.getPersonLikeUsername(username);
	}
	@Override
	public int updateMainPorxy(MainProxy mainProxy) {
		// TODO Auto-generated method stub
		return mainProxyDao.updateMainProxy(mainProxy);
	}


}
