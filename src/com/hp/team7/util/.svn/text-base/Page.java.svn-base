package com.hp.team7.util;

import java.util.List;

/**
 * 查询结果分页工具类
 *
 */
public class Page {
    
    @SuppressWarnings("rawtypes")
	private List list;        //要返回的某一页的记录列表
    
    private int allRow;         //总记录数
    private int totalPage;        //总页数
    private int currentPage;    //当前页
    private int pageSize;        //每页记录数
    
	@SuppressWarnings("unused")
	private boolean isFirstPage;    //是否为第一页
	@SuppressWarnings("unused")
	private boolean isLastPage;        //是否为最后一页
    @SuppressWarnings("unused")
	private boolean hasPreviousPage;    //是否有前一页
    @SuppressWarnings("unused")
	private boolean hasNextPage;        //是否有下一页

    /**
	 * @return the list
	 */
	@SuppressWarnings("rawtypes")
	public List getList() {
		return list;
	}

	/**
	 * @param list the list to set
	 */
	@SuppressWarnings("rawtypes")
	public void setList(List list) {
		this.list = list;
	}

	/**
	 * @return the allRow
	 */
	public int getAllRow() {
		return allRow;
	}

	/**
	 * @param allRow the allRow to set
	 */
	public void setAllRow(int allRow) {
		this.allRow = allRow;
	}

	/**
	 * @return the totalPage
	 */
	public int getTotalPage() {
		return totalPage;
	}

	/**
	 * @param totalPage the totalPage to set
	 */
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	/**
	 * @return the currentPage
	 */
	public int getCurrentPage() {
		return currentPage;
	}

	/**
	 * @param currentPage the currentPage to set
	 */
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	/**
	 * @return the pageSize
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * @param pageSize the pageSize to set
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * @param isFirstPage the isFirstPage to set
	 */
	public void setFirstPage(boolean isFirstPage) {
		this.isFirstPage = isFirstPage;
	}

	/**
	 * @param isLastPage the isLastPage to set
	 */
	public void setLastPage(boolean isLastPage) {
		this.isLastPage = isLastPage;
	}

	/**
	 * @param hasPreviousPage the hasPreviousPage to set
	 */
	public void setHasPreviousPage(boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;
	}

	/**
	 * @param hasNextPage the hasNextPage to set
	 */
	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}

	/**
     * 初始化分页信息
     */
    public void init(){
        this.isFirstPage = isFirstPage();
        this.isLastPage = isLastPage();
        this.hasPreviousPage = isHasPreviousPage();
        this.hasNextPage = isHasNextPage();
    }
    
    /**
     * 以下判断页的信息,只需getter方法(is方法)即可
     * 如是当前页是第1页
     * @return
     */
    public boolean isFirstPage() {
        return currentPage == 1;    
    }
    
    /**
     * 如果当前页是最后一页
     * @return
     */
    public boolean isLastPage() {
        return currentPage == totalPage;    
    }
    
    /**
     * 只要当前页不是第1页
     * @return
     */
    public boolean isHasPreviousPage() {
        return currentPage != 1;       
    }
    
    /**
     * 只要当前页不是最后1页
     * @return
     */
    public boolean isHasNextPage() {
        return currentPage != totalPage;    
    }
    
    
    /**
     * 计算总页数,静态方法,供外部直接通过类名调用
     * @param pageSize 每页记录数
     * @param allRow 总记录数
     * @return 总页数
     */
    public static int countTotalPage(final int pageSize,final int allRow){
        int totalPage = allRow % pageSize == 0 ? allRow/pageSize : allRow/pageSize+1;
        return totalPage;
    }
    
    /**
     * 计算当前页开始记录
     * @param pageSize 每页记录数
     * @param currentPage 当前第几页
     * @return 当前页开始记录号
     */
    public static int countOffset(final int pageSize,final int currentPage){
        final int offset = pageSize*(currentPage-1);
        return offset;
    }
    
    /**
     * 计算当前页,若为0或者请求的URL中没有"?page=",则用1代替
     * @param page 传入的参数(可能为空,即0,则返回1)
     * @return 当前页
     */
    public static int countCurrentPage(int page){
        final int curPage = (page==0?1:page);
        return curPage;
    }
}

