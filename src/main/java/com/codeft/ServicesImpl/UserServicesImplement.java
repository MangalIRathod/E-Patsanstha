package com.codeft.ServicesImpl;



import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.persistence.ElementCollection;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Repository;

import com.codeft.Entity.Add_Member;
import com.codeft.Entity.Annual_Report;
import com.codeft.Entity.EmergencyLoan;
import com.codeft.Entity.FixedDeposite;
import com.codeft.Entity.Insurance;
import com.codeft.Entity.Loan;
import com.codeft.Entity.MonthlyDeposit;
import com.codeft.Entity.RecurringDeposit;
import com.codeft.Entity.RecurringDepositeNew;
import com.codeft.Entity.Share;
import com.codeft.Entity.Trans.Trans_Share;
import com.codeft.Entity.UserSign;
import com.codeft.Repository.Add_Member_Repository;
import com.codeft.Repository.EmergencyLoanRepository;
import com.codeft.Repository.FDRepository;
import com.codeft.Repository.InsuranceRepository;
import com.codeft.Repository.LoanRepository;
import com.codeft.Repository.MonthlyDepositeRepository;
import com.codeft.Repository.RDNewRepository;
import com.codeft.Repository.RDRepository;
import com.codeft.Repository.ShareRepository;
import com.codeft.Repository.UserSignRepository;
import com.codeft.Services.UserServices;

@Repository
public class UserServicesImplement implements UserServices{

	@PersistenceContext
    private EntityManager entityManager;
	
	@ElementCollection  
	
	@Autowired
	UserSignRepository userrepository;
	
	@Autowired
	Add_Member_Repository amr;
	
	@Autowired
	FDRepository FD;
	
	@Autowired
	RDRepository RD;
	
	@Autowired
	MonthlyDepositeRepository MD;
	
	@Autowired
	ShareRepository SH;
	
	@Autowired
	InsuranceRepository IN;
	
	@Autowired
	LoanRepository LO;
	
	@Autowired
	EmergencyLoanRepository ELO;
	
	@Autowired
	RDNewRepository RDNR;
	
	@Override
	public String loginvalidate(String acc_no, String password) {
		String string = "Fail";
		String user_name = "abc";
		UserSign user = null;
		try
		{
	 user = userrepository.finduserByMob(acc_no, password);
		
	//	System.out.println("login:  "+user.getAcc_no());
		
		if(user.getAcc_no().equals(acc_no)) {
			string = "Success";
			user_name = user.getName();
		}
		}
		catch (Exception e) {
			System.out.println( e);
		}
	
		return string+":"+user_name;
	}

	@Override
	public String RegisterUser(UserSign us) {
	
		userrepository.save(us);
		
		
		return "Success";
	}


	
	
	@Override
	public Add_Member GetAddMemberProfile(String AccountNumber) {
				
		Add_Member add_membe = amr.finduserprofileByAccountNumber(AccountNumber);
		return add_membe;
	}

	/*
	@Override
	public String save_user_profile(Add_Member user_profile) {
	
		user_pro.save(user_profile);
		return "Success";
	}

	
	@Override
	public userprofile GetUserProfile(String AccountNumber) {
		
		userprofile profile = user_pro.finduserprofileByAccountNumber(AccountNumber);	
		return profile;
	}
	
	@Transactional
	public String update_user_profile(userprofile user_profile_update) {
		Session session = null;
        int modifications = 0;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("update userprofile set full_name='" + user_profile_update.getFull_name() + "', mreg_date ='" + user_profile_update.getMreg_date() + "', department='" + user_profile_update.getDepartment() + "', designation='" + user_profile_update.getDesignation() + "',dob ='" + user_profile_update.getDob() + "', doj='" + user_profile_update.getDoj() + "', do_reg='"+user_profile_update.getDo_reg()+"', mobile_no='"+user_profile_update.getMobile_no()+"', econtact_no='"+user_profile_update.getEcontact_no()+"', email_id='"+user_profile_update.getEmail_id()+"', address='"+user_profile_update.getAddress()+"', bank_acc_no='"+user_profile_update.getBank_acc_no()+"', bank_name='"+user_profile_update.getBank_name()+"', branch_name='"+user_profile_update.getBranch_name()+"', photo='"+user_profile_update.getPhoto()+"' where acc_no ='" + user_profile_update.getAcc_no() + "' ");
            modifications = query.executeUpdate();
            if (modifications == 1) {
                return "Success";
            }
            return "Fail";
        }
        catch (Exception e) {
            e.printStackTrace();
            return "Fail";
        }
	}
	*/

	@Transactional
	public String UpdateUserPassword(UserSign userReg) {
		Session session = null;
        int modifications = 0;
        //int u_id = POJO.getU_id();
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
        try {
            final Query query = (Query)session.createNativeQuery("update usersign set password='" + userReg.getPassword() + "' where acc_no ='"+userReg.getAcc_no()+"' ");
            modifications = query.executeUpdate();
            if (modifications == 1) {
                return "Success";
            }
            return "Fail";
        }
        catch (Exception e) {
            e.printStackTrace();
            return "Fail";
        }
	}
	
	
	@Override
	public List<FixedDeposite> getFD(String AccountNumber) {		
		List<FixedDeposite> fd = FD.findfdByAccountNumber(AccountNumber);
		Optional<List<FixedDeposite>> fixeddeposite = Optional.of(fd);
		return fixeddeposite.get();
	}

	@Override
	public List<RecurringDeposit> getRD(String AccountNumber) {
		List<RecurringDeposit> rd = RD.findrdByAccountNumber(AccountNumber);
		return rd;
	}

	@Override
	public MonthlyDeposit getMonthlyDepositeUser(String AccountNUmber) {
		MonthlyDeposit md = MD.findmdByAccountNumber(AccountNUmber);
	
		return md;
	}

	@Override
	public Share GetShareByuser(String AccountNumber) {
		Share sh = SH.findshareByAccountNumber(AccountNumber);
		return sh;
	}

	@Override
	public Insurance GetInsuranceOfUser(String AccountNumber) {
		Insurance ins = IN.findinsuranceByAccountNumber(AccountNumber);
		return ins;
	}

	@Override
	public Loan GetLoanOfUser(String AccountNumber) {
	Loan loan = LO.findloanByAccountNumber(AccountNumber);
		return loan;
	}

	@Override
	public EmergencyLoan GetEmergencyLoanOfUser(String AccountNumber) {
		EmergencyLoan elo = ELO.findELByAccountNumber(AccountNumber);
		return elo;
	}
	
	
	
	@Override
	public double GetRecurringDepositOfNewUser(String AccountNumber) {
		
		Session session = null;
		double rd_tot = 0.0;
		String tot_rd = "";	
		String status = "start";
			if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
			throw new NullPointerException();
			}
			try {
			
			final Query query = (Query)session.createNativeQuery("select accno, sum(totamt) from new_rd where accno='"+AccountNumber+"' AND status='"+status+"'");
			final List<Object[]> result = (List<Object[]>)query.getResultList();
			
			for (final Object[] res : result) {
				  RecurringDepositeNew  ts = new RecurringDepositeNew();
				
				  res[0].toString();
				  tot_rd = res[1].toString();	
				  rd_tot = Double.parseDouble(tot_rd);
			}
			
			}
			catch (Exception e) {	
				System.out.println(e);
					}
		return rd_tot;
	}
	
	@Override
	public double GetFDOfNewUser(String AccountNumber) {
		Session session = null;
		double fd_tot = 0.0;
		String tot_fd = "";		
		String status = "start";
			if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
			throw new NullPointerException();
			}
			try {
			
			final Query query = (Query)session.createNativeQuery("select accountnumber, sum(fdamount) from fixeddeposite where accountnumber='"+AccountNumber+"' AND status='"+status+"'");
			final List<Object[]> result = (List<Object[]>)query.getResultList();
			
			for (final Object[] res : result) {
				  RecurringDepositeNew  ts = new RecurringDepositeNew();
				
				  res[0].toString();
				  tot_fd = res[1].toString();	
				  fd_tot = Double.parseDouble(tot_fd);
			}
			
			}
			catch (Exception e) {	
				System.out.println(e);
					}
		return fd_tot;
	}

	@Override
	public Resource load(String filename) {
	 Path root = Paths.get("ProfilePhoto");
		 try {
		      Path file = root.resolve(filename);
		      Resource resource = new UrlResource(file.toUri());
		      if (resource.exists() || resource.isReadable()) {
		        return resource;
		      } else {
		        throw new RuntimeException("Could not read the file!");
		      }
		    } catch (MalformedURLException e) {
		      throw new RuntimeException("Error: " + e.getMessage());
		    }
	}
	
	
	@Override
	public List<Trans_Share> GetTransShareDetails(String acc_no) {
		Session session = null;
		  final List<Trans_Share> list = new ArrayList<Trans_Share>();
if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
  throw new NullPointerException();
}
try {
	
	  //String mobile = POJO.getMobileno();
	  String status = "Success";
  //final Query query = (Query)session.createNativeQuery("select * from share ");
  final Query query = (Query)session.createNativeQuery("select date, sum(shareallot) from trans_share where accountnumber='"+acc_no+"' group by date");
  final List<Object[]> result = (List<Object[]>)query.getResultList();

  for (final Object[] res : result) {
	  Trans_Share  ts = new Trans_Share();
	/*  
	  sh.setAccountnumber(res[0].toString());
	  sh.setFullname(res[1].toString());
	  sh.setShareallot(res[2].toString());
	  sh.setDate(res[3].toString());	  
	  sh.setTotalamountofsahre(res[4].toString());
	  sh.setFyear(res[5].toString());
	  */
	  
	  ts.setDate(res[0].toString());
	  ts.setShareallot(res[1].toString());
	  
	  list.add(ts);        	     	
  }
 
}
catch (Exception e) {			
		}
		return list;
	}

	@Override
	public List<EmergencyLoan> GetEmergencyLoanDetails(String acc_no) {
		Session session = null;
		  final List<EmergencyLoan> list = new ArrayList<EmergencyLoan>();
if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
throw new NullPointerException();
}
try {
	
	  String status = "Success";
final Query query = (Query)session.createNativeQuery("select date, sum(principalamount) from emergency_loan where accountnumber='"+acc_no+"' group by date");
final List<Object[]> result = (List<Object[]>)query.getResultList();

for (final Object[] res : result) {
	EmergencyLoan  el = new EmergencyLoan();	
	  
	el.setDate(res[0].toString());
	el.setE_principalamount(res[1].toString());
	  
	  list.add(el);        	     	
}

}
catch (Exception e) {			
		}
		return list;
	}

	@Override
	public List<FixedDeposite> GetFixedDepositeDetails(String acc_no) {
		Session session = null;
		  final List<FixedDeposite> list = new ArrayList<FixedDeposite>();
if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
throw new NullPointerException();
}
try {
	  String status = "Success";
final Query query = (Query)session.createNativeQuery("select fddate, sum(fdamount) from fixeddeposite where accountnumber='"+acc_no+"' group by fddate");
final List<Object[]> result = (List<Object[]>)query.getResultList();

for (final Object[] res : result) {
	FixedDeposite  fd = new FixedDeposite();	
	  
	  fd.setFddate(res[0].toString());
	  fd.setFdamount(res[1].toString());
	  
	  list.add(fd);        	     	
}

}
catch (Exception e) {			
		}
		return list;
	}

	@Override
	public List<RecurringDeposit> GetRecurringDepositeDetails(String acc_no) {
		Session session = null;
		  final List<RecurringDeposit> list = new ArrayList<RecurringDeposit>();
if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
throw new NullPointerException();
}
try {
		String status = "Success";
		final Query query = (Query)session.createNativeQuery("select rddate, sum(rdamount) from rd where accountnumber='"+acc_no+"' group by rddate");
		final List<Object[]> result = (List<Object[]>)query.getResultList();
		
		for (final Object[] res : result) {
			RecurringDeposit  rd = new RecurringDeposit();	
			  
			  rd.setRddate(res[0].toString());
			  rd.setRdamount(Double.parseDouble(res[1].toString()));
			  
			  list.add(rd);        	     	
		}

}
catch (Exception e) {			
		}
		return list;
	}

	

	@Override
	public List<Annual_Report> GetAllAnnualReportDetails(String accountnumber, String sdate, String edate) {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
          //final Query query = (Query)session.createNativeQuery("Select sh.date, sh.shareallot, sh.totalamountofshare, md.m_debit, md.m_deposit, ins.insdebt, ins.totalinsuranceamount, rdd.rdamount,rdd.totalamount, nl.principalamount, nl.loanbalance, nl.intrestamount, el.e_principalamount, el.eloanbalance, el.e_intrestamount FROM trans_share sh INNER JOIN trans_monthlydeposit md ON sh.accountnumber = md.accountnumber INNER JOIN trans_insurance ins ON ins.accountnumber = sh.accountnumber INNER JOIN rd rdd ON rdd.accountnumber = sh.accountnumber INNER JOIN new_loan_trans nl ON nl.accountnumber = sh.accountnumber INNER JOIN emergency_loan_trans el ON el.accountnumber = sh.accountnumber where sh.accountnumber='"+accountnumber+"'");
          final Query query = (Query)session.createNativeQuery("SELECT md.cdate,sh.shareallot, sh.totalamountofshare, md.m_debit, md.m_deposit, ins.insdebt, ins.totalinsuranceamount, IFNULL(rdd.rdamount,0), IFNULL(rdd.totalamount,0),IFNULL(nl.principalamount, 0) ,IFNULL(nl.loanbalance, 0) , IFNULL(nl.intrestamount,0), IFNULL(el.e_principalamount,0), IFNULL(el.eloanbalance,0), IFNULL(el.e_intrestamount,0) FROM trans_share sh LEFT JOIN trans_monthlydeposit md ON sh.accountnumber = md.accountnumber AND sh.date = md.cdate LEFT JOIN trans_insurance ins ON sh.accountnumber = ins.accountnumber AND sh.date = ins.date LEFT JOIN rd rdd ON rdd.accountnumber = sh.accountnumber AND rdd.rddate=sh.date LEFT JOIN new_loan_trans nl ON nl.accountnumber = sh.accountnumber AND (DATE_FORMAT(nl.date, '%m-%y')) = (DATE_FORMAT(sh.date, '%m-%y')) LEFT JOIN emergency_loan_trans el ON el.accountnumber = sh.accountnumber AND el.date = sh.date where sh.date BETWEEN '"+sdate+"' AND '"+edate+"' AND sh.accountnumber= '"+accountnumber+"'");
         // final Query query = (Query)session.createNativeQuery("Select nl.date,sh.shareallot, sh.totalamountofshare, md.m_debit, md.m_deposit, ins.insdebt, ins.totalinsuranceamount, rdd.rdamount, rdd.totalamount, nl.principalamount, nl.loanbalance, nl.intrestamount, el.e_principalamount, el.eloanbalance, el.e_intrestamount FROM trans_share sh INNER JOIN trans_monthlydeposit md ON sh.accountnumber = md.accountnumber AND sh.date = md.cdate INNER JOIN trans_insurance ins ON sh.accountnumber = ins.accountnumber AND sh.date = ins.date INNER JOIN rd rdd ON rdd.accountnumber = sh.accountnumber AND rdd.rddate=sh.date INNER JOIN new_loan_trans nl ON nl.accountnumber = sh.accountnumber AND (DATE_FORMAT(nl.date, '%m-%y')) = (DATE_FORMAT(sh.date, '%m-%y')) INNER JOIN emergency_loan_trans el ON el.accountnumber = sh.accountnumber AND el.date = sh.date where sh.date BETWEEN '"+sdate+"' AND '"+edate+"' AND sh.accountnumber= '"+accountnumber+"'");
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();
            final List<Annual_Report> list = new ArrayList<Annual_Report>();
            for (final Object[] res : result) {
                final Annual_Report data = new Annual_Report();
               
                data.setCdate(res[0].toString()); 
               // dgddg
                data.setShare_debit(res[1].toString());
                data.setShare_total(res[2].toString());
                
                data.setMd_debit(res[3].toString());
                data.setMd_total(res[4].toString());
                
                data.setInsurance_debit(res[5].toString());
                data.setInsurance_total(res[6].toString());
                
                data.setRd_debit(res[7].toString());                
                data.setRd_total(res[8].toString());
                
                data.setR_principalamount(res[9].toString());
                data.setR_balanceloan(res[10].toString());
                data.setR_intrestamount(res[11].toString());
                
                data.setE_principalamount(res[12].toString());
                data.setE_balanceloan(res[13].toString());
                data.setE_intrestamount(res[14].toString());
                
                System.out.println(res[0].toString()+"   "+res[2].toString());
                
                double total = Double.parseDouble(res[1].toString())+Double.parseDouble(res[3].toString())+Double.parseDouble(res[5].toString())+Double.parseDouble(res[7].toString())+Double.parseDouble(res[9].toString())+Double.parseDouble(res[11].toString())+Double.parseDouble(res[12].toString())+Double.parseDouble(res[14].toString());
          
                String total1 = String.valueOf(total);
                data.setTotal(total1);
          
                list.add(data);
               
            }
            
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}

	@Override
	public Set<Annual_Report> GetAllSETAnnualReportDetails(String accountnumber, String sdate, String edate) {
		Session session = null;
        if (this.entityManager == null || (session = (Session)this.entityManager.unwrap((Class)Session.class)) == null) {
            throw new NullPointerException();
        }
          //final Query query = (Query)session.createNativeQuery("Select sh.date, sh.shareallot, sh.totalamountofshare, md.m_debit, md.m_deposit, ins.insdebt, ins.totalinsuranceamount, rdd.rdamount,rdd.totalamount, nl.principalamount, nl.loanbalance, nl.intrestamount, el.e_principalamount, el.eloanbalance, el.e_intrestamount FROM trans_share sh INNER JOIN trans_monthlydeposit md ON sh.accountnumber = md.accountnumber INNER JOIN trans_insurance ins ON ins.accountnumber = sh.accountnumber INNER JOIN rd rdd ON rdd.accountnumber = sh.accountnumber INNER JOIN new_loan_trans nl ON nl.accountnumber = sh.accountnumber INNER JOIN emergency_loan_trans el ON el.accountnumber = sh.accountnumber where sh.accountnumber='"+accountnumber+"'");
          //final Query query = (Query)session.createNativeQuery("Select sh.date,sh.shareallot, sh.totalamountofshare, md.m_debit, md.m_deposit, ins.insdebt, ins.totalinsuranceamount, rdd.rdamount, rdd.totalamount, nl.principalamount, nl.loanbalance, nl.intrestamount, el.e_principalamount, el.eloanbalance, el.e_intrestamount FROM trans_share sh INNER JOIN trans_monthlydeposit md ON sh.accountnumber = md.accountnumber AND sh.date = md.cdate INNER JOIN trans_insurance ins ON sh.accountnumber = ins.accountnumber AND sh.date = ins.date INNER JOIN rd rdd ON rdd.accountnumber = sh.accountnumber AND rdd.rddate=sh.date INNER JOIN new_loan_trans nl ON nl.accountnumber = sh.accountnumber AND nl.date = sh.date INNER JOIN emergency_loan_trans el ON el.accountnumber = sh.accountnumber AND el.date = sh.date where sh.date BETWEEN '"+sdate+"' AND '"+edate+"' AND sh.accountnumber= '"+accountnumber+"' ");
          final Query query = (Query)session.createNativeQuery("Select nl.date,sh.shareallot, sh.totalamountofshare, md.m_debit, md.m_deposit, ins.insdebt, ins.totalinsuranceamount, rdd.rdamount, rdd.totalamount, nl.principalamount, nl.loanbalance, nl.intrestamount, el.e_principalamount, el.eloanbalance, el.e_intrestamount FROM trans_share sh INNER JOIN trans_monthlydeposit md ON sh.accountnumber = md.accountnumber AND sh.date = md.cdate INNER JOIN trans_insurance ins ON sh.accountnumber = ins.accountnumber AND sh.date = ins.date INNER JOIN rd rdd ON rdd.accountnumber = sh.accountnumber AND rdd.rddate=sh.date INNER JOIN new_loan_trans nl ON nl.accountnumber = sh.accountnumber AND (DATE_FORMAT(nl.date, '%m-%y')) = (DATE_FORMAT(sh.date, '%m-%y')) INNER JOIN emergency_loan_trans el ON el.accountnumber = sh.accountnumber AND el.date = sh.date where sh.date BETWEEN '"+sdate+"' AND '"+edate+"' AND sh.accountnumber= '"+accountnumber+"'");
        try {
            final List<Object[]> result = (List<Object[]>)query.getResultList();            
            Set<Annual_Report> list=new LinkedHashSet<Annual_Report>();  
            for (final Object[] res : result) {
                final Annual_Report data = new Annual_Report();
               
                data.setCdate(res[0].toString()); 
                
                data.setShare_debit(res[1].toString());
                data.setShare_total(res[2].toString());
                
                data.setMd_debit(res[3].toString());
                data.setMd_total(res[4].toString());
                
                data.setInsurance_debit(res[5].toString());
                data.setInsurance_total(res[6].toString());
                
                data.setRd_debit(res[7].toString());                
                data.setRd_total(res[8].toString());
                
                data.setR_principalamount(res[9].toString());
                data.setR_balanceloan(res[10].toString());
                data.setR_intrestamount(res[11].toString());
                
                data.setE_principalamount(res[12].toString());
                data.setE_balanceloan(res[13].toString());
                data.setE_intrestamount(res[14].toString());
                
                System.out.println(res[0].toString()+"   "+res[2].toString());
                
                double total = Double.parseDouble(res[1].toString())+Double.parseDouble(res[3].toString())+Double.parseDouble(res[5].toString())+Double.parseDouble(res[7].toString())+Double.parseDouble(res[9].toString())+Double.parseDouble(res[11].toString())+Double.parseDouble(res[12].toString())+Double.parseDouble(res[14].toString());
          
                String total1 = String.valueOf(total);
                data.setTotal(total1);
          
                list.add(data);
               
            }
            
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}

	@Override
	public List<RecurringDepositeNew> GetAllNewRDInformation(String AccountNumber) {
		List<RecurringDepositeNew> RDN = RDNR.findNewRDByAccountNumber(AccountNumber);
		return RDN;
	}

	@Override
	public List<Loan> GetUserRegularLoan(String AccountNumber) {
		List<Loan> ln = LO.findRegularLoanDataByAccountNumber(AccountNumber);
		return ln;
	}

	@Override
	public List<EmergencyLoan> GetUserEmergencyLoanDetails(String acc_no) {
		List<EmergencyLoan> el = ELO.findEmergencyLoanByUserAccountNumber(acc_no);
		return el;
	}

	

	
	
	
	

}
