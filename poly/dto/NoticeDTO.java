package poly.dto;

/**
 * @author 이협건
 * @version 1.1 공지사항 DTO
 */
public class NoticeDTO {
		private int post_no;
		private String post_title;
		private String post_contents;
		private String post_writer;
		private String post_date;
		
		public int getPost_no() {
			return post_no;
		}
		public void setPost_no(int post_no) {
			this.post_no = post_no;
		}
		public String getPost_title() {
			return post_title;
		}
		public void setPost_title(String post_title) {
			this.post_title = post_title;
		}
		public String getPost_contents() {
			return post_contents;
		}
		public void setPost_contents(String post_contents) {
			this.post_contents = post_contents;
		}
		public String getPost_writer() {
			return post_writer;
		}
		public void setPost_writer(String post_writer) {
			this.post_writer = post_writer;
		}
		public String getPost_date() {
			return post_date;
		}
		public void setPost_date(String post_date) {
			this.post_date = post_date;
		}
	

}
