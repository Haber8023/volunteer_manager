package com.zzx.Dao;

import org.apache.ibatis.annotations.Param;

public interface AdminMapper {

	public String get_admin_psw(@Param("admin_name") String admin_name);

	public void update_admin_psw(@Param("admin_name") String admin_name, @Param("password_new") String password_new);

	public void insert_admin(@Param("admin_name_input") String admin_name_input,
			@Param("admin_psw_input") String admin_psw_input);

}
