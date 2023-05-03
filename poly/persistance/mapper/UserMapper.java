package poly.persistance.mapper;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface UserMapper {
	public UserDTO getLogin(UserDTO tempDTO) throws Exception;

	public int insertUser(UserDTO uDTO) throws Exception;

	public String getIdChk(String user_id) throws Exception;
}
