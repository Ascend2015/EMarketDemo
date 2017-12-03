package cn.tj212.emarket.deal.entity;

import java.util.Date;
import java.util.List;

public class DealCategory {

    private Long parentId;

    private String name;

    private String urlName;

    private Integer publishStatus;

    private Date createTime;

    private Integer orderNum;

    private Integer deep;

    private List<DealCategory> children;

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrlName() {
        return urlName;
    }

    public void setUrlName(String urlName) {
        this.urlName = urlName;
    }

    public Integer getPublishStatus() {
        return publishStatus;
    }

    public void setPublishStatus(Integer publishStatus) {
        this.publishStatus = publishStatus;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    public Integer getDeep() {
        return deep;
    }

    public void setDeep(Integer deep) {
        this.deep = deep;
    }

    public List<DealCategory> getChildren() {
        return children;
    }

    public void setChildren(List<DealCategory> children) {
        this.children = children;
    }
}
