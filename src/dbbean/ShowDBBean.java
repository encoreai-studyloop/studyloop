package dbbean;

import java.util.List;
import java.util.Map;

import commons.SqlMapClient;
import databean.ApplyDataBean;
import databean.AttendeeDataBean;
import databean.CertificateDataBean;
import databean.ExpDataBean;
import databean.LanguageDataBean;
import databean.LocationDataBean;
import databean.SchoolDataBean;
import databean.StudyDataBean;
import databean.StudyTimeDataBean;
import databean.UserDataBean;

public class ShowDBBean implements ShowDao{
	public StudyDataBean getStudyInfo( int id ) {
		return SqlMapClient.getSession().selectOne( "Studyloop.getStudyInfo", id );
	}
	public StudyTimeDataBean getStudyTime( int id ) {
		return SqlMapClient.getSession().selectOne( "Studyloop.getStudyTime", id );
	}
	public LocationDataBean getLocation( int id ) {
		return SqlMapClient.getSession().selectOne( "Studyloop.getLocation", id );
	}
	public int getCntAttendee( int study_id ) {
		return SqlMapClient.getSession().selectOne( "Studyloop.getCntAttendee", study_id );
	}
	public List<Integer> getIdListAttendee( int study_id ) {
		return SqlMapClient.getSession().selectList( "Studyloop.getIdListAttendee", study_id );
	}
	public SchoolDataBean getSchoolData( int user_id ) {
		return SqlMapClient.getSession().selectOne( "Studyloop.getSchoolData", user_id );
	}
	public UserDataBean getMyData( int user_id ) {
		return SqlMapClient.getSession().selectOne( "Studyloop.getMyData", user_id );
	}
	public int insertAttendee( AttendeeDataBean attendeeDto ) {
		return SqlMapClient.getSession().insert( "Studyloop.insertAttendee", attendeeDto );
	}
	public int insertSchool( SchoolDataBean schoolDto ) {
		return SqlMapClient.getSession().insert( "Studyloop.insertSchool", schoolDto );
	}
	public int insertCareer( ExpDataBean expDto ) {
		return SqlMapClient.getSession().insert( "Studyloop.insertCareer", expDto );
	}
	public int insertLanguage( LanguageDataBean languageDto ) {
		return SqlMapClient.getSession().insert( "Studyloop.insertLanguage", languageDto );
	}
	public int insertCertificate( CertificateDataBean certificateDto ) {
		return SqlMapClient.getSession().insert( "Studyloop.insertCertificate", certificateDto );
	}
	public ApplyDataBean loadPrevData( int user_id ) {
		ApplyDataBean applyDto = new ApplyDataBean();
		if ( SqlMapClient.getSession().selectOne( "Studyloop.getAttendeeData", user_id ) != null ) {
			AttendeeDataBean attendeeDto = SqlMapClient.getSession().selectOne( "Studyloop.getAttendeeData", user_id );
			applyDto.setAttendeeData( attendeeDto );
		}
		if (SqlMapClient.getSession().selectOne( "Studyloop.getSchoolData", user_id ) != null ) {
			SchoolDataBean schoolDto = SqlMapClient.getSession().selectOne( "Studyloop.getSchoolData", user_id );
			applyDto.setSchoolData( schoolDto );
		}
		if ( SqlMapClient.getSession().selectList( "Studyloop.getExpList", user_id ) != null ) {
			List<ExpDataBean> expDtoList = SqlMapClient.getSession().selectList( "Studyloop.getExpList", user_id );
			applyDto.setExpData( expDtoList );
		}
		if ( SqlMapClient.getSession().selectList( "Studyloop.getLangList", user_id ) != null ) {
			List<LanguageDataBean> langDtoList = SqlMapClient.getSession().selectList( "Studyloop.getLangList", user_id );
			applyDto.setLangData( langDtoList );
		}
		if ( SqlMapClient.getSession().selectList( "Studyloop.getCertList", user_id ) != null ) {
			List<CertificateDataBean> certDtoList = SqlMapClient.getSession().selectList( "Studyloop.getCertList", user_id );
			applyDto.setCertData( certDtoList );
		}
		if ( SqlMapClient.getSession().selectOne( "Studyloop.getRateByUserId", user_id ) != null ) {
            double user_rate = SqlMapClient.getSession().selectOne( "Studyloop.getRateByUserId", user_id );
            applyDto.setRateToString( user_rate );
        }
		return applyDto;
		
	}
	public int deleteSchool( int user_id ) {
		return SqlMapClient.getSession().delete( "Studyloop.deleteSchool", user_id );
	}
	public int deleteCareer( int user_id ) {
		return SqlMapClient.getSession().delete( "Studyloop.deleteCareer", user_id );
	}
	public int deleteLanguage( int user_id ) {
		return SqlMapClient.getSession().delete( "Studyloop.deleteLanguage", user_id );
	}
	public int deleteCertificate( int user_id ) {
		return SqlMapClient.getSession().delete( "Studyloop.deleteCertificate", user_id );
	}
	public AttendeeDataBean getMineApplied( Map<String, Integer> id_map ) {
        return SqlMapClient.getSession().selectOne( "Studyloop.getMineApplied", id_map );
    }
	public int getStudyIdbyUserId(Integer study_id) {
		
		return SqlMapClient.getSession().selectOne( "Studyloop.getStudyIdbyUserId", study_id );
	}
	public int addCurPersonnel( int study_id ) {
        return SqlMapClient.getSession().update( "Studyloop.addCurPersonnel", study_id );
    }
    public int subCurPersonnel( int study_id ) {
        return SqlMapClient.getSession().update( "Studyloop.subCurPersonnel", study_id );
    }
	
}