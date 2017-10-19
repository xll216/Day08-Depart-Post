package com.lanou.action;

import com.lanou.domain.Department;
import com.lanou.domain.Post;
import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 蓝鸥科技有限公司  www.lanou3g.com.
 */
public class CustomerAction extends ActionSupport {
    private List<Department> departments;
    private List<Post> postList;
    private String departId;

    {
        departments = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            Department department = new Department();
            department.setId(i);
            department.setName("部门" + i);

            List<Post> posts = new ArrayList<>();
            for (int j = 0; j < 5; j++) {
                Post post = new Post();
                post.setId(j);
                post.setName(i + "职务" + j);
                posts.add(post);
            }

            department.setPostList(posts);

            departments.add(department);
        }
    }

    public String findDepartment() {

        return SUCCESS;
    }

    public String findPost() {
        int id = Integer.parseInt(departId);
        postList = departments.get(id).getPostList();
        return SUCCESS;
    }

    public List<Department> getDepartments() {
        return departments;
    }

    public void setDepartments(List<Department> departments) {
        this.departments = departments;
    }

    public List<Post> getPostList() {
        return postList;
    }

    public void setPostList(List<Post> postList) {
        this.postList = postList;
    }

    public String getDepartId() {
        return departId;
    }

    public void setDepartId(String departId) {
        this.departId = departId;
    }
}
