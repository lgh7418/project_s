package com.company.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.domain.AddressVO;
@Repository
public class AddressDAOImpl implements AddressDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "mappers.addressMapper";
	
	@Override
	public void insertAddress(AddressVO addressVO) throws Exception {
		sqlSession.insert(namespace + ".insertAddress", addressVO);
	}

	@Override
	public Integer getAddressNo(String goods_address) throws Exception {
		return sqlSession.selectOne(namespace + ".getAddressNo", goods_address);
	}

}
