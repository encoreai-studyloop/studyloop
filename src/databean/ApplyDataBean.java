package databean;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
public class ApplyDataBean {
    private int attendee_id;
    private String purpose;
    private String goal;
    private int user_id;
    private String school_name;
    private String school_major;
    private String school_status;
    private ArrayList<String> experience = new ArrayList<String>();
    private ArrayList<String> exp_start = new ArrayList<String>();  // for data loading
    private ArrayList<String> exp_end = new ArrayList<String>();    // for data loading
    private ArrayList<String> language = new ArrayList<String>();   // for data loading
    private ArrayList<String> lang_name = new ArrayList<String>();
    private ArrayList<String> lang_score = new ArrayList<String>();
    private ArrayList<String> lang_obtain = new ArrayList<String>();// for data loading
    private ArrayList<String> cert_name = new ArrayList<String>();
    private ArrayList<String> cert_score = new ArrayList<String>();
    private ArrayList<String> cert_obtain = new ArrayList<String>();// for data loading
    private String rate;
    SimpleDateFormat inputFormat = new SimpleDateFormat( "MM/dd/yyyy" );
    
    
    public int getAttendee_id() {
        return attendee_id;
    }
    public void setAttendee_id(int attendee_id) {
        this.attendee_id = attendee_id;
    }
    public String getPurpose() {
        return purpose;
    }
    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }
    public String getGoal() {
        return goal;
    }
    public void setGoal(String goal) {
        this.goal = goal;
    }
    public int getUser_id() {
        return user_id;
    }
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    public String getSchool_name() {
        return school_name;
    }
    public void setSchool_name(String school_name) {
        this.school_name = school_name;
    }
    public String getSchool_major() {
        return school_major;
    }
    public void setSchool_major(String school_major) {
        this.school_major = school_major;
    }
    public String getSchool_status() {
        return school_status;
    }
    public void setSchool_status(String school_status) {
        this.school_status = school_status;
    }
    public ArrayList<String> getExperience() {
        return experience;
    }
    public void setExperience(ArrayList<String> experience) {
        this.experience = experience;
    }
    public ArrayList<String> getExp_start() {
        return exp_start;
    }
    public void setExp_start(ArrayList<String> exp_start) {
        this.exp_start = exp_start;
    }
    public ArrayList<String> getExp_end() {
        return exp_end;
    }
    public void setExp_end(ArrayList<String> exp_end) {
        this.exp_end = exp_end;
    }
    public ArrayList<String> getLanguage() {
        return language;
    }
    public void setLanguage(ArrayList<String> language) {
        this.language = language;
    }
    public ArrayList<String> getLang_name() {
        return lang_name;
    }
    public void setLang_name(ArrayList<String> lang_name) {
        this.lang_name = lang_name;
    }
    public ArrayList<String> getLang_score() {
        return lang_score;
    }
    public void setLang_score(ArrayList<String> lang_score) {
        this.lang_score = lang_score;
    }
    public ArrayList<String> getLang_obtain() {
        return lang_obtain;
    }
    public void setLang_obtain(ArrayList<String> lang_obtain) {
        this.lang_obtain = lang_obtain;
    }
    public ArrayList<String> getCert_name() {
        return cert_name;
    }
    public void setCert_name(ArrayList<String> cert_name) {
        this.cert_name = cert_name;
    }
    public ArrayList<String> getCert_score() {
        return cert_score;
    }
    public void setCert_score(ArrayList<String> cert_score) {
        this.cert_score = cert_score;
    }
    public ArrayList<String> getCert_obtain() {
        return cert_obtain;
    }
    public void setCert_obtain(ArrayList<String> cert_obtain) {
        this.cert_obtain = cert_obtain;
    }
    public String getRate() {
        return rate;
    }
    public void setRate(String rate) {
        this.rate = rate;
    }
    
    public void setAttendeeData(AttendeeDataBean attendeeDto) {
        setAttendee_id( attendeeDto.getId());
        setPurpose( attendeeDto.getPurpose() );
        setGoal( attendeeDto.getGoal() );
        setUser_id( attendeeDto.getUser_id() );
    }
    
    public void setSchoolData(SchoolDataBean schoolDto) {
        setSchool_name( schoolDto.getName() );
        setSchool_major( schoolDto.getMajor() );
        setSchool_status( schoolDto.getStatus() );
    }
    public void setExpData(List<ExpDataBean> expDtoList) {
        for (ExpDataBean exp : expDtoList) {
            this.experience.add( exp.getExperience() );
            this.exp_start.add( inputFormat.format( exp.getStart_date() ) );
            this.exp_end.add( inputFormat.format( exp.getEnd_date() ) );
        }
    }
    
    public void setLangData(List<LanguageDataBean> langDtoList) {
        for (LanguageDataBean lang : langDtoList) {
            this.language.add( lang.getLanguage() );
            this.lang_name.add( lang.getName() );
            this.lang_score.add( lang.getScore() );
            this.lang_obtain.add( inputFormat.format( lang.getObtain_date() ) );
        }
    }
    
    public void setCertData(List<CertificateDataBean> certDtoList) {
        for (CertificateDataBean cert : certDtoList) { 
            this.cert_name.add( cert.getName() );
            this.cert_score.add( cert.getScore() );
            this.cert_obtain.add( inputFormat.format( cert.getObtain_date() ) );
        }
    }
    
    public void setRateToString( double rate ) {
        this.setRate( Double.toString( rate ) );
    }
    
}