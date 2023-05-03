package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.NoticeDTO;
import poly.dto.UserDTO;
import poly.persistance.mapper.NoticeMapper;
import poly.service.INoticeService;

@Service("NoticeService")
public class NoticeService implements INoticeService{
	
	@Resource(name="NoticeMapper")
	private NoticeMapper noticeMapper;

	@Override
	public int insertPost(NoticeDTO nDTO) throws Exception {
		return noticeMapper.insertPost(nDTO);
	}
	
	@Override
	public List<NoticeDTO> getNotice() throws Exception {
		List<NoticeDTO> list = null;
	      list = noticeMapper.getNotice();
		return list;
	}
	
}
