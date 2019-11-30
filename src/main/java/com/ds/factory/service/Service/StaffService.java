package com.ds.factory.service.Service;

import com.ds.factory.datasource.entities.Staff;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Objects;

@Service
public interface StaffService {
    List<Staff> selectByConstrain(String username,String loginame);




    Staff getStaffByLoginame(String loginame);

    int update_Password_By_PrimaryKey(String username, String OldPassword, String NewPassword);
    //返回：1（旧密码错误）；2（新密码存在空值）；3（两个新密码冲突）；4（密码未变更）；5（MD5转化失败）；6（修改成功）

    int Register_new_Staff(String loginname, String password) throws Exception;
    //返回：1（密码空）；2（两次密码不一致）；3（已经注册的用户名与密码）；4（人员注册过多，超过上限一百万）；5（添加过程失败）；6（注册成功）

    List<Staff> getAll_Staff()throws Exception;
    //全员信息

    boolean checkLoginName(String loginame);//用loginame查重
    boolean exist_or_not(String Staff_no);//用主键id判断是否存在


    int validateUser(String loginname, String password) throws Exception;

    /***********************************************************************************/

    int updateByPrimaryKeySelective(Staff staff);//更新的Staff，除了主键以外均可以为null，null部分数据库不更新

    int deleteByPrimaryKey(String loginname);//用主键删除
    int insertSelective(Staff record);//Staff部分内容可以null，加入表内就是null


    int countByExample();//最好不要用这个

    Staff selectByPrimaryKey(String Staff_no);//用主键选人

    Staff getCurrentUser()throws Exception;
}