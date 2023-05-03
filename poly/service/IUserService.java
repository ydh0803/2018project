package poly.service;

import poly.dto.UserDTO;

public interface IUserService {
	public UserDTO getLogin(UserDTO tempDTO) throws Exception;

	public String getIdChk(String user_id) throws Exception;

	public int insertUser(UserDTO uDTO) throws Exception;
}
