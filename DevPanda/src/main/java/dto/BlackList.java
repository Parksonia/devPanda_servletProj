package dto;

public class BlackList {
    
    private int blackNum;          // 블랙리스트 아이디
    private String declPerson;     // 신청자 개인 id
    private String declCom;        // 신청자 기업 id
    private int transactionNum;    // 거래번호식별자
    private int bidNum;            // 입찰번호식별자
    private String blackPerson;    // 대상자 개인 id
    private String blackCom;       // 대상자 기업 id
    private String title;          // 제목
    private String content;        // 신고사유
    private String reportDate;     // 등록일
    private String roleType;       // 거래자타입

    // 기본 생성자
    public BlackList() {}

    // 매개변수가 있는 생성자
    public BlackList(int blackNum, String declPerson, String declCom, int transactionNum, int bidNum, 
                        String blackPerson, String blackCom, String title, String content, String reportDate, String roleType) {
        this.blackNum = blackNum;
        this.declPerson = declPerson;
        this.declCom = declCom;
        this.transactionNum = transactionNum;
        this.bidNum = bidNum;
        this.blackPerson = blackPerson;
        this.blackCom = blackCom;
        this.title = title;
        this.content = content;
        this.reportDate = reportDate;
        this.roleType = roleType;
    }

    // Getter 및 Setter 메서드
    public int getBlackNum() {
        return blackNum;
    }

    public void setBlackNum(int blackNum) {
        this.blackNum = blackNum;
    }

    public String getDeclPerson() {
        return declPerson;
    }

    public void setDeclPerson(String declPerson) {
        this.declPerson = declPerson;
    }

    public String getDeclCom() {
        return declCom;
    }

    public void setDeclCom(String declCom) {
        this.declCom = declCom;
    }

    public int getTransactionNum() {
        return transactionNum;
    }

    public void setTransactionNum(int transactionNum) {
        this.transactionNum = transactionNum;
    }

    public int getBidNum() {
        return bidNum;
    }

    public void setBidNum(int bidNum) {
        this.bidNum = bidNum;
    }

    public String getBlackPerson() {
        return blackPerson;
    }

    public void setBlackPerson(String blackPerson) {
        this.blackPerson = blackPerson;
    }

    public String getBlackCom() {
        return blackCom;
    }

    public void setBlackCom(String blackCom) {
        this.blackCom = blackCom;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getReportDate() {
        return reportDate;
    }

    public void setReportDate(String reportDate) {
        this.reportDate = reportDate;
    }

    public String getRoleType() {
        return roleType;
    }

    public void setRoleType(String roleType) {
        this.roleType = roleType;
    }
}
