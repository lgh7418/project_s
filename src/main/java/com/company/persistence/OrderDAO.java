package com.company.persistence;

import java.util.List;
import java.util.Map;

import com.company.domain.OrderGoodsVO;
import com.company.domain.OrderInfoVO;

public interface OrderDAO {
	public int insertOrderInfo(OrderInfoVO orderInfoVO) throws Exception;
	public void insertOrderGoods(OrderGoodsVO orderGoodsVO) throws Exception;
	public List<OrderInfoVO> selectOrderInfo(int member_no);
	public List<OrderGoodsVO> selectOrderGoods(int order_no);
	public void updateOrderInfo(OrderInfoVO orderInfoVO) throws Exception;
	public List<OrderInfoVO> selectSellerOrderInfo(Map<String, Integer> selector) throws Exception;
	public void updateOrderStatus(Map<String, Integer> selector)throws Exception;
	public void deleteOrder(String goods_name) throws Exception;
	public void deleteOrderInfo(int order_no) throws Exception;
}
