package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.NoticeDTO;
import poly.dto.UserDTO;

@Mapper("NoticeMapper")
public interface NoticeMapper {
	public int insertPost(NoticeDTO nDTO) throws Exception;
	public List<NoticeDTO> getNotice() throws Exception;

}
