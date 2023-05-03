package poly.dto;

public class UserDTO {
		private int user_no;
		private String user_id;
		private String user_pw;
		private String user_name;
		private String user_email1;
		private String user_email2;
		
		public String getUser_email1() {
			return user_email1;
		}
		public void setUser_email1(String user_email1) {
			this.user_email1 = user_email1;
		}
		public String getUser_email2() {
			return user_email2;
		}
		public void setUser_email2(String user_email2) {
			this.user_email2 = user_email2;
		}
		public int getUser_no() {
			return user_no;
		}
		public void setUser_no(int user_no) {
			this.user_no = user_no;
		}
		public String getUser_id() {
			return user_id;
		}
		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}
		public String getUser_pw() {
			return user_pw;
		}
		public void setUser_pw(String user_pw) {
			this.user_pw = user_pw;
		}
		public String getUser_name() {
			return user_name;
		}
		public void setUser_name(String user_name) {
			this.user_name = user_name;
		}
}