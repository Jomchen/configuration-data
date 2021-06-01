package com.jomkie.test;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;
import java.util.List;


public class TestJoUser implements Serializable {

    private String id;
    private String parentId;
    private String name;

    public TestJoUser() {}
    public TestJoUser(String id, String parentId, String name) {
        this.id = id;
        this.parentId = parentId;
        this.name = name;
    }

    private List<TestJoUser> childs;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<TestJoUser> getChilds() {
        return childs;
    }

    public void setChilds(List<TestJoUser> childs) {
        this.childs = childs;
    }

}
