package poly.service;

import java.util.List;

import poly.dto.NoticeDTO;
import poly.dto.UserDTO;

public interface INoticeService {
	
	public int insertPost(NoticeDTO nDTO) throws Exception;
	public List<NoticeDTO> getNotice() throws Exception;

}
