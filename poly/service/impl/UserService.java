package poly.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.UserDTO;
import poly.persistance.mapper.UserMapper;
import poly.service.IUserService;

@Service("UserService")
public class UserService implements IUserService{
	
	@Resource(name="UserMapper")
	private UserMapper userMapper;

	@Override
	public UserDTO getLogin(UserDTO tempDTO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getLogin(tempDTO);
	}

	@Override
	public int insertUser(UserDTO uDTO) throws Exception {
		return userMapper.insertUser(uDTO);
	}

	@Override
	public String getIdChk(String user_id) throws Exception {
		System.out.println("service");
		return userMapper.getIdChk(user_id);
}

	
}
