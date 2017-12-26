package com.augmentum.oes.common;

public class Pagination {
    private int PageCount;
    private int PageCurrent;
    private int RecordRange;
    private int RecordCount;

    public int getPageCount() {
        return PageCount;
    }

    public void setPageCount(int pageCount) {
        PageCount = pageCount;
    }

    public int getPageCurrent() {
        return PageCurrent;
    }

    public void setPageCurrent(int pageCurrent) {
        PageCurrent = pageCurrent;
    }

    public int getRecordRange() {
        return RecordRange;
    }

    public void setRecordRange(int recordRange) {
        RecordRange = recordRange;
    }

    public int getRecordCount() {
        return RecordCount;
    }

    public void setRecordCount(int recordCount) {
        RecordCount = recordCount;
    }
}
