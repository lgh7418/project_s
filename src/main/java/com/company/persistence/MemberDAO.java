package com.company.persistence;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.company.domain.MemberVO;
import com.company.dto.LoginDTO;

public interface MemberDAO {
	//public MemberVO login(Map loginMap) throws DataAccessException;
	public MemberVO login(LoginDTO loginDTO) throws Exception;
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
}