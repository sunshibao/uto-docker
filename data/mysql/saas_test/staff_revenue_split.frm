�
    0  �B         ; 	      -       �  ��  '        //                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       �         �  B@ �PRIMARY�index_id�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            InnoDB                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 �                                           员工订单业绩拆分表                                                                                                                                                                                        � �  B�         P      � )                                          pk_id  id  	order_id  	staff_id  staff_name 	 staff_type 
 split_ratio  split_money  operator_id  operator_type  is_del  created_time  updated_time  description       -    B@   - 	   B@   - 	   B    - Dx    @   - 	 �  
    -' 
 �  @   -'  �  @   -  �  B@   -  �  
@   -,  �  
    -%  �  @   -  �  @   - C��       - �pk_id�id�order_id�staff_id�staff_name�staff_type�split_ratio�split_money�operator_id�operator_type�is_del�created_time�updated_time�description� 主键自增ID全局唯一ID订单ID员工ID销售名称销售类型 1-主销售 2-协助销售拆分比率整数（单位万分位）拆分金额（单位：分）操作人ID操作人类型 1:系统, 2:员工, 3:会员是否删除, 0 未删除 1 已删除创建时间修改时间备注