�
    0  �;         ; 	      -        �  ��  '        //                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       �         �  B@ �PRIMARY�index_id�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      InnoDB                                                                                                                                                                                                                                                        0                                           商户登录记录表                                                                                                                                                                                              � �  ;z         P    �  � )                                          pk_id  id  	staff_id  login_type  system_type 	 account_id 
 	third_id  phone  ip  token  login_time  is_del  updated_time  created_time       -    B@   - 	   B    -    
@   -E    
@   -' 	   B@   -Q 
	   B@   -Q I�'  @   .5  % C@   -   - @   .  / @   -  3 
    -#  4 @   -  8 @   - �pk_id�id�staff_id�login_type�system_type�account_id�third_id�phone�ip�token�login_time�is_del�updated_time�created_time� 主键自增ID全局唯一ID员工ID登录类型，1账号登录，2手机登录，3第三方授权登录系统类型,1、saas（后续预留）login_type为1时，记录商户的账号id，跟t_staff_account表主键id关联login_type为3时，记录商户的账号id，跟t_third_account表主键id关联login_type为2时，记录商户的登录手机号码登录ip长整型数字登录态token值登录时间是否删除，1删除，0未删除修改时间创建时间