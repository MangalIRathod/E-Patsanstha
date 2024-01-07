package com.codeft.controller;



import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.codeft.Beans.JavaBeans;
import com.codeft.Entity.Add_Member;
import com.codeft.Entity.Annual_Report;
import com.codeft.Entity.EmergencyLoan;
import com.codeft.Entity.FixedDeposite;
import com.codeft.Entity.Insurance;
import com.codeft.Entity.Loan;
import com.codeft.Entity.MonthlyDeposit;
import com.codeft.Entity.Notification;
import com.codeft.Entity.RecurringDeposit;
import com.codeft.Entity.RecurringDepositeNew;
import com.codeft.Entity.Share;
import com.codeft.Entity.Trans.Trans_Share;
import com.codeft.Entity.UserSign;
import com.codeft.Entity.Trans.EmeregencyLoanTrans;
import com.codeft.Entity.Trans.Loan_Trans;
import com.codeft.Entity.Trans.TransInsurance;
import com.codeft.Entity.Trans.Trans_MonthlyDeposit;
import com.codeft.PasswordSecurity.SecuredPass;
import com.codeft.Repository.Add_Member_Repository;
import com.codeft.Repository.FDRepository;
import com.codeft.Services.AdminServices;
import com.codeft.Services.TransactionalService;
import com.codeft.Services.UserServices;


@Controller
//@RequestMapping({"/User"})
public class UserController {
	
	JavaBeans javabeans = new JavaBeans();

	@Autowired 
	AdminServices AdminServ;
	
	@Autowired
	UserServices userservice;
	
	@Autowired
	Add_Member_Repository amr;
	
	@Autowired
	TransactionalService TransServ;
	
	@RequestMapping({"index"})
	public String index()
	{
		System.out.println("hello user");
		
		return "index";
	}
	
	@RequestMapping({"user_index"})
	public String user_index(final Model model,HttpSession session)
	{
		
		double TotalAmount = 0;
		 LocalDate today = LocalDate.now();
		 String AccountNumber = "";
		
		 try
		 {
			AccountNumber	 = (String) session.getAttribute("AccountNumber");
			List<Notification> ntf = AdminServ.GetAllNotificationInformation();
			model.addAttribute("ntf", ntf);
		 }
		 catch (Exception e) {
			// TODO: handle exception
		}
		
		
		 /* 
		try
		{
		List<FixedDeposite> fd = userservice.getFD(AccountNumber);
		
		String string = fd.get(0).getFddate();
		if(!string.equals("0"))
		{
		String string1[] = string.split("-");
		int year =Integer.parseInt(string1[0]);
		int month = Integer.parseInt(string1[1]);
		int date = Integer.parseInt(string1[2]);
		LocalDate FDDate = LocalDate.of(year,month,date);
		
		//	Period FDMonth = Period.between(today,FDDate);
		//  int months = FDMonth.getMonths();
		long months = ChronoUnit.MONTHS.between(FDDate,today);
		  
		  double a  = 0.07;
		  double InterstAmount = a * Double.parseDouble(fd.get(0).getFdamount());
		  InterstAmount = (InterstAmount/12) * months;
		  TotalAmount = InterstAmount + Double.parseDouble(fd.get(0).getFdamount());
		}
		  
		double total_fd = Math.round(TotalAmount);	
		//model.addAttribute("FD", Double.toString(TotalAmount));
		model.addAttribute("FD",total_fd);
		
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		
		try {
		List<RecurringDeposit> rd = userservice.getRD(AccountNumber);
		String total_rd = rd.get(0).getTotalamount();
		double total_rdamount = Double.valueOf(total_rd);
		double RD = Math.round(total_rdamount);
		//model.addAttribute("RD", rd.get(0).getTotalamount());
		model.addAttribute("RD", RD);
		} catch (Exception e) {
			// TODO: handle exception
		}
		*/
		 try {
				double fdn = userservice.GetFDOfNewUser(AccountNumber);
				double tot_fd = Math.round(fdn);			
				model.addAttribute("FD", tot_fd);
			} catch (Exception e) {
				// TODO: handle exception
			}	 
		 		
		try {
			double rdn = userservice.GetRecurringDepositOfNewUser(AccountNumber);
			double tot_rd = Math.round(rdn);			
			model.addAttribute("RD", tot_rd);
		} catch (Exception e) {
			// TODO: handle exception
		}		
		 	
		try {  		 
			MonthlyDeposit md = userservice.getMonthlyDepositeUser(AccountNumber);
		  	String month_deposit = md.getM_deposit();
			double m_deposit = Double.valueOf(month_deposit);
			double MDeposit = Math.round(m_deposit);	
			//model.addAttribute("MDeposit", md.getMdeposit());
			model.addAttribute("MDeposit", MDeposit);
		} catch (Exception e) {
			System.out.println(e);
		}  
		
		try {
			Insurance ins = userservice.GetInsuranceOfUser(AccountNumber);
		  	String total_ins = ins.getTotalinsuranceamount();
			double total_insurance = Double.valueOf(total_ins);
			double TotalInsuranceAmount = Math.round(total_insurance);
			//model.addAttribute("TotalInsuranceAmount", ins.getTotalinsuranceamount());
			model.addAttribute("TotalInsuranceAmount", TotalInsuranceAmount);
		} catch (Exception e) {
			System.out.println(e);
		}	
		
		try {
			Share share = userservice.GetShareByuser(AccountNumber);		
			String total_share = share.getTotalamountofsahre();
			double total_sh = Double.valueOf(total_share);
			double TotalAmountOfSahre = Math.round(total_sh);
			//model.addAttribute("TotalAmountOfSahre",share.getTotalamountofsahre());
			model.addAttribute("TotalAmountOfSahre",TotalAmountOfSahre);
		} catch (Exception e) {
			System.out.println(e);
		}	
		
		try {
			Loan loan = userservice.GetLoanOfUser(AccountNumber);
			String total_loan = loan.getLoanbalance();
			double total_loanamount = Double.valueOf(total_loan);
			double LoanAmount = Math.round(total_loanamount);
			//model.addAttribute("LoanAmount", loan.getLoanbalance());
			model.addAttribute("LoanAmount", LoanAmount);
		} catch (Exception e) {
			// TODO: handle exception
		}	
		
		try {
			EmergencyLoan elo = userservice.GetEmergencyLoanOfUser(AccountNumber);	
			String total_emer = elo.getEloanbalance();
			double total_emergency = Double.valueOf(total_emer);
			double TotalAmountEmergencyLoan = Math.round(total_emergency);
			//model.addAttribute("TotalAmountEmergencyLoan", elo.getEloanbalance());
			model.addAttribute("TotalAmountEmergencyLoan", TotalAmountEmergencyLoan);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "user_index";
	}
	
	@RequestMapping({"user_login"})
	public String user_login()
	{		
		System.out.println("hello user");
		return "user_login";
	}
	
	@RequestMapping({"user_register"})
	public String user_register()
	{	
		System.out.println("hello user");
		return "user_register";
	}
	
	@RequestMapping({"user_forgot_password"})
	public String user_forgot_password()
	{	
		System.out.println("hello user_forgot_password");
		return "user_forgot_password";
	}
	
	@RequestMapping({"user_forgot_password_otp"})
	public String user_forgot_password_otp()
	{	
		System.out.println("hello user_forgot_password_otp");
		return "user_forgot_password_otp";
	}
	
	@RequestMapping({"user_annual_report"})
	public String user_annual_report()
	{	
		System.out.println("hello user_annual_report");
		return "user_annual_report";
	}
	
	@RequestMapping({"user_notification"})
	public String Notification(final Model model)
	{
		System.out.println("hello user_notification");
		List<Notification> ntf = AdminServ.GetAllNotificationInformation();
		model.addAttribute("ntf", ntf);
		return "user_notification"; 
	}
	
	@RequestMapping(value = {"user_annual_report_data"}, method = {RequestMethod.POST},  consumes = "multipart/form-data")
	@ ResponseBody
	public String fd_report(HttpServletRequest request)
	{
		String string = "Success";
		
		String sdate = request.getParameter("sdate"); 
		String edate = request.getParameter("edate");
		javabeans.setAr_sdate(sdate);
		javabeans.setAr_edate(edate);		
		
		return string;
	}
	
	@RequestMapping({"user_annual_report_print"})
	public String user_annual_report(final Model model,HttpSession session)
	{			
		
		String sdate = javabeans.getAr_sdate();
		String edate = javabeans.getAr_edate();
		
		String syear[] = sdate.split("-");
		String eyear[] = edate.split("-");
		
		String ecoyear = syear[0]+"-"+eyear[0];
		model.addAttribute("ecoyear", ecoyear);
		
		System.out.println("hello user_annual_report_print");	
		double TotalAmount = 0;
		LocalDate today = LocalDate.now();
		String AccountNumber = (String) session.getAttribute("AccountNumber");			
		
		Add_Member profile = userservice.GetAddMemberProfile(AccountNumber);
		
		if(profile != null)
		{
			model.addAttribute("fullname", profile.getFullname());
			model.addAttribute("accountnumber", profile.getAccountnumber());
			model.addAttribute("department", profile.getDepartment());
			model.addAttribute("designation", profile.getDesignation());
			model.addAttribute("dob", profile.getDob());
			model.addAttribute("doj", profile.getDoj());
			model.addAttribute("dor", profile.getDor());
			model.addAttribute("mobile", profile.getMobile());
			model.addAttribute("email", profile.getEmail());
			model.addAttribute("address", profile.getAddress());
			model.addAttribute("shares", profile.getShares());
			model.addAttribute("monthlydeposit", profile.getMonthlydeposit());
			model.addAttribute("insurance", profile.getInsurance());			
			model.addAttribute("bankaccount", profile.getBankaccount());
			model.addAttribute("bankname", profile.getBankname());
			model.addAttribute("branchcode", profile.getBranchcode());
			model.addAttribute("branchname", profile.getBranchname());
			model.addAttribute("nominee", profile.getNominee());
			model.addAttribute("nomineerelation", profile.getNomineerelation());
						
		}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		try
		{
		List<FixedDeposite> fd = userservice.getFD(AccountNumber);
		
		String string = fd.get(0).getFddate();
		if(!string.equals("0"))
		{
		String string1[] = string.split("-");
		int year =Integer.parseInt(string1[0]);
		int month = Integer.parseInt(string1[1]);
		int date = Integer.parseInt(string1[2]);
		  LocalDate FDDate = LocalDate.of(year, month,date);
			
		long months =  ChronoUnit.MONTHS.between( FDDate,today);
		  
		  double a  = 0.07;
		  double InterstAmount = a * Double.parseDouble(fd.get(0).getFdamount());
		  InterstAmount = (InterstAmount/12) * months;
		  TotalAmount = InterstAmount + Double.parseDouble(fd.get(0).getFdamount());
		}
		  
		model.addAttribute("FD", Double.toString(TotalAmount));
		
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		MonthlyDeposit md = userservice.getMonthlyDepositeUser(AccountNumber);
		Insurance ins = userservice.GetInsuranceOfUser(AccountNumber);
		Share share = userservice.GetShareByuser(AccountNumber);
		EmergencyLoan elo = userservice.GetEmergencyLoanOfUser(AccountNumber);
		//List<RecurringDeposit> rd = userservice.getRD(AccountNumber);
		double rdn = userservice.GetRecurringDepositOfNewUser(AccountNumber);
		double tot_rd = Math.round(rdn);			
		Loan loan = userservice.GetLoanOfUser(AccountNumber);
		
		model.addAttribute("MDeposit", md.getM_deposit());
		model.addAttribute("TotalInsuranceAmount", ins.getTotalinsuranceamount());
		model.addAttribute("TotalAmountOfSahre",share.getTotalamountofsahre());
		if(elo != null)
		model.addAttribute("TotalAmountEmergencyLoan", elo.getEloanbalance());
		//model.addAttribute("RD", rd.get(0).getTotalamount());
		model.addAttribute("RD", tot_rd);
		model.addAttribute("LoanAmount", loan.getLoanbalance());
////////////////////////////////////////////////////////////////////////////////////////////////////////		
		
		
		//List<Trans_Share> UserShareData = TransServ.GetUserShareData(AccountNumber);
		//model.addAttribute("ShareData", UserShareData);
		
		List<Annual_Report> user_annual_data = userservice.GetAllAnnualReportDetails(AccountNumber, sdate, edate);
		//Set<Annual_Report> user_annual_data = userservice.GetAllSETAnnualReportDetails(AccountNumber, sdate, edate);
		model.addAttribute("user_annual_data", user_annual_data);
		
		return "user_annual_report_print";
	}
	
	@RequestMapping({"graph_dividend"})
	public String graph_dividend(final Model model,HttpSession session)
	{	
		
		 try
		 {
			String AccountNumber = (String) session.getAttribute("AccountNumber");
			//userprofile up = user_pro.finduserprofileByAccountNumber(AccountNumber);
			Add_Member up = amr.finduserprofileByAccountNumber(AccountNumber);
			//String photopath = up.getPhoto();
			//String uploadDir = new ClassPathResource("static/PhotoProfile/").getFile().getAbsolutePath();
			 //Path uploadPath = Paths.get(uploadDir);
			// Path filePath = uploadPath.resolve(photopath);
			//String string123 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/PhotoProfile/").path(photopath).toUriString();
			//System.out.println( "Store File Path:  "+string123);
			//model.addAttribute("PHOTO", string123);
		 }
		 catch (Exception e) {
			// TODO: handle exception
		}
	
		System.out.println("hello graph_dividend");		
		return "graph_dividend";
	}
	@RequestMapping({"graph_emergency_loan"})
	public String graph_emergency_loan(final Model model,HttpSession session)
	{	
		 try
		 {
			String AccountNumber	 = (String) session.getAttribute("AccountNumber");
			//userprofile up = user_pro.finduserprofileByAccountNumber(AccountNumber);
			Add_Member up = amr.finduserprofileByAccountNumber(AccountNumber);
			//String photopath = up.getPhoto();
			//String uploadDir = new ClassPathResource("static/PhotoProfile/").getFile().getAbsolutePath();
			 //Path uploadPath = Paths.get(uploadDir);
			// Path filePath = uploadPath.resolve(photopath);
			//String string123 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/PhotoProfile/").path(photopath).toUriString();
			//System.out.println( "Store File Path:  "+string123);
			//model.addAttribute("PHOTO", string123);
		 }
		 catch (Exception e) {
			// TODO: handle exception
		}
		
		System.out.println("hello graph_emergency_loan");		
		return "graph_emergency_loan";
	}
	@RequestMapping({"graph_fd"})
	public String graph_fd(final Model model,HttpSession session)
	{	
		 try
		 {
			String AccountNumber	 = (String) session.getAttribute("AccountNumber");
			//userprofile up = user_pro.finduserprofileByAccountNumber(AccountNumber);
			Add_Member up = amr.finduserprofileByAccountNumber(AccountNumber);
			//String photopath = up.getPhoto();
			//String uploadDir = new ClassPathResource("static/PhotoProfile/").getFile().getAbsolutePath();
			 //Path uploadPath = Paths.get(uploadDir);
			// Path filePath = uploadPath.resolve(photopath);
			//String string123 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/PhotoProfile/").path(photopath).toUriString();
			//System.out.println( "Store File Path:  "+string123);
			//model.addAttribute("PHOTO", string123);
		 }
		 catch (Exception e) {
			// TODO: handle exception
		}
		
		System.out.println("hello graph_fd");		
		return "graph_fd";
	}
	@RequestMapping({"graph_insurance"})
	public String graph_insurance(final Model model,HttpSession session)
	{	
		
		 try
		 {
			String AccountNumber	 = (String) session.getAttribute("AccountNumber");
			//userprofile up = user_pro.finduserprofileByAccountNumber(AccountNumber);
			Add_Member up = amr.finduserprofileByAccountNumber(AccountNumber);
			//String photopath = up.getPhoto();
			//String uploadDir = new ClassPathResource("static/PhotoProfile/").getFile().getAbsolutePath();
			 //Path uploadPath = Paths.get(uploadDir);
			// Path filePath = uploadPath.resolve(photopath);
			//String string123 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/PhotoProfile/").path(photopath).toUriString();
			//System.out.println( "Store File Path:  "+string123);
			//model.addAttribute("PHOTO", string123);
		 }
		 catch (Exception e) {
			// TODO: handle exception
		}
	
		System.out.println("hello graph_insurance");		
		return "graph_insurance";
	}
	@RequestMapping({"graph_monthly_deposit"})
	public String graph_monthly_deposit(final Model model,HttpSession session)
	{	
		
		 try
		 {
			String AccountNumber	 = (String) session.getAttribute("AccountNumber");
			//userprofile up = user_pro.finduserprofileByAccountNumber(AccountNumber);
			Add_Member up = amr.finduserprofileByAccountNumber(AccountNumber);
			//String photopath = up.getPhoto();
			//String uploadDir = new ClassPathResource("static/PhotoProfile/").getFile().getAbsolutePath();
			//Path uploadPath = Paths.get(uploadDir);
			// Path filePath = uploadPath.resolve(photopath);
			//String string123 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/PhotoProfile/").path(photopath).toUriString();
			//System.out.println( "Store File Path:  "+string123);
			//model.addAttribute("PHOTO", string123);
		 }
		 catch (Exception e) {
			// TODO: handle exception
		}
		
		System.out.println("hello graph_monthly_deposit");		
		return "graph_monthly_deposit";
	}
	@RequestMapping({"graph_rd"})
	public String graph_rd(final Model model,HttpSession session)
	{	
		
		 try
		 {
			String AccountNumber	 = (String) session.getAttribute("AccountNumber");
			//userprofile up = user_pro.finduserprofileByAccountNumber(AccountNumber);
			Add_Member up = amr.finduserprofileByAccountNumber(AccountNumber);
			//String photopath = up.getPhoto();
			//String uploadDir = new ClassPathResource("static/PhotoProfile/").getFile().getAbsolutePath();
			 //Path uploadPath = Paths.get(uploadDir);
			// Path filePath = uploadPath.resolve(photopath);
			//String string123 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/PhotoProfile/").path(photopath).toUriString();
			//System.out.println( "Store File Path:  "+string123);
			//model.addAttribute("PHOTO", string123);
		 }
		 catch (Exception e) {
			// TODO: handle exception
		}
		
		System.out.println("hello graph_rd");		
		return "graph_rd";
	}
	@RequestMapping({"graph_regular_loan"})
	public String graph_regular_loan(final Model model,HttpSession session)
	{	
		
		 try
		 {
			String AccountNumber	 = (String) session.getAttribute("AccountNumber");
			//userprofile up = user_pro.finduserprofileByAccountNumber(AccountNumber);
			Add_Member up = amr.finduserprofileByAccountNumber(AccountNumber);
			//String photopath = up.getPhoto();
			//String uploadDir = new ClassPathResource("static/PhotoProfile/").getFile().getAbsolutePath();
			//Path uploadPath = Paths.get(uploadDir);
			// Path filePath = uploadPath.resolve(photopath);
			//String string123 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/PhotoProfile/").path(photopath).toUriString();
			//System.out.println( "Store File Path:  "+string123);
			//model.addAttribute("PHOTO", string123);
		 }
		 catch (Exception e) {
			// TODO: handle exception
		}
		
		System.out.println("hello graph_regular_loan");		
		return "graph_regular_loan";
	}
	@RequestMapping({"graph_share"})
	public String graph_share(final Model model,HttpSession session)
	{	
		
		 try
		 {
			String AccountNumber	 = (String) session.getAttribute("AccountNumber");
			//userprofile up = user_pro.finduserprofileByAccountNumber(AccountNumber);
			Add_Member up = amr.finduserprofileByAccountNumber(AccountNumber);
			//String photopath = up.getPhoto();
			//String uploadDir = new ClassPathResource("static/PhotoProfile/").getFile().getAbsolutePath();
			 //Path uploadPath = Paths.get(uploadDir);
			// Path filePath = uploadPath.resolve(photopath);
			//String string123 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/PhotoProfile/").path(photopath).toUriString();
			//System.out.println( "Store File Path:  "+string123);
			//model.addAttribute("PHOTO", string123);
		 }
		 catch (Exception e) {
			// TODO: handle exception
		}
		
		System.out.println("hello graph_share");		
		return "graph_share";
	}
	
	@GetMapping("/get-fd_data")
    public ResponseEntity<Map<String, Double>> getFDChart(final HttpSession session) {
		final String acc_no = (String)session.getAttribute("AccountNumber");
        Map<String, Double> graphData = new TreeMap<>();
        List<FixedDeposite> fdlist = (List<FixedDeposite>)this.userservice.GetFixedDepositeDetails(acc_no);
        
        for (Iterator iterator = fdlist.iterator(); iterator.hasNext();) {
        	FixedDeposite fd = (FixedDeposite) iterator.next();
		//	System.out.println(share.getFyear()+"   "+share.getTotalamountofsahre());				
			double abc = Double.parseDouble(fd.getFdamount());
			graphData.put(fd.getFddate(), abc);
		}       
        return new ResponseEntity<>(graphData, HttpStatus.OK);
    }
	
	@GetMapping("/get-rd_data")
    public ResponseEntity<Map<String, Double>> getRDChart(final HttpSession session) {
		final String acc_no = (String)session.getAttribute("AccountNumber");
        Map<String, Double> graphData = new TreeMap<>();
        List<RecurringDeposit> rdlist = (List<RecurringDeposit>)this.userservice.GetRecurringDepositeDetails(acc_no);
        
        for (Iterator iterator = rdlist.iterator(); iterator.hasNext();) {
        	RecurringDeposit rd = (RecurringDeposit) iterator.next();
		//	System.out.println(share.getFyear()+"   "+share.getTotalamountofsahre());				
			double abc = rd.getRdamount();
			graphData.put(rd.getRddate(), abc);
		}       
        return new ResponseEntity<>(graphData, HttpStatus.OK);
    }
	
	@GetMapping("/get-emergency_loan_data")
    public ResponseEntity<Map<String, Double>> getEmergencyLoanChart(final HttpSession session) {
		final String acc_no = (String)session.getAttribute("AccountNumber");
        Map<String, Double> graphData = new TreeMap<>();
        List<EmeregencyLoanTrans> ellist = TransServ.getUserEmergencyTransLoanData(acc_no);
        for (Iterator iterator = ellist.iterator(); iterator.hasNext();) {
        	EmeregencyLoanTrans el = (EmeregencyLoanTrans) iterator.next();
		//	System.out.println(share.getFyear()+"   "+share.getTotalamountofsahre());				
			double abc = Double.parseDouble(el.getE_principalamount());
			graphData.put(el.getDate(), abc);
		}       
        return new ResponseEntity<>(graphData, HttpStatus.OK);
    }
	
	@GetMapping("/get-share_data")
    public ResponseEntity<Map<String, Double>> getPieChart(final HttpSession session) {
		final String acc_no = (String)session.getAttribute("AccountNumber");
        Map<String, Double> graphData = new TreeMap<>();
        List<Trans_Share> sharelist = (List<Trans_Share>)this.userservice.GetTransShareDetails(acc_no);
        
        for (Iterator iterator = sharelist.iterator(); iterator.hasNext();) {
        	Trans_Share share = (Trans_Share) iterator.next();
		//	System.out.println(share.getFyear()+"   "+share.getTotalamountofsahre());
		
		
			double abc = Double.parseDouble(share.getShareallot());
			graphData.put(share.getDate(), abc);
		}
        /*
        graphData.put("2016", 1470);
        graphData.put("2017", 1256);
        graphData.put("2018", 3856);
        graphData.put("2019", 19807);
        */
        return new ResponseEntity<>(graphData, HttpStatus.OK);
    }
	
	@GetMapping("/get-monthlydeposit_data")
    public ResponseEntity<Map<String, Double>> getMonthlyDeposit(final HttpSession session) {
		final String acc_no = (String)session.getAttribute("AccountNumber");
        Map<String, Double> graphData = new TreeMap<>();
        //List<Trans_MonthlyDeposit> sharelist = (List<Trans_MonthlyDeposit>)this.userservice.GetTransM(acc_no);
        List<Trans_MonthlyDeposit> monthdepo = TransServ.getUserTransMonthlyDepositData(acc_no);
        
        for (Iterator iterator = monthdepo.iterator(); iterator.hasNext();) {
        	Trans_MonthlyDeposit monthdepo1 = (Trans_MonthlyDeposit) iterator.next();		
			double abc = Double.parseDouble(monthdepo1.getM_debit());
			graphData.put(monthdepo1.getCdate(), abc);
		}        
        return new ResponseEntity<>(graphData, HttpStatus.OK);
    }
	
	@GetMapping("/get-monthlyinsurance_data")
    public ResponseEntity<Map<String, Double>> getMonthlyInsurance(final HttpSession session) {
		final String acc_no = (String)session.getAttribute("AccountNumber");
        Map<String, Double> graphData = new TreeMap<>();
        List<TransInsurance> InsuranceData = TransServ.getUserInsuranceData(acc_no);        
        for (Iterator iterator = InsuranceData.iterator(); iterator.hasNext();) {
        	TransInsurance InsuranceData1 = (TransInsurance) iterator.next();		
			double abc = Double.parseDouble(InsuranceData1.getInsdebt());
			graphData.put(InsuranceData1.getDate(), abc);
		}        
        return new ResponseEntity<>(graphData, HttpStatus.OK);
    }
	
	@GetMapping("/get-regular_loan_data")
    public ResponseEntity<Map<String, Double>> getRegularLoan(final HttpSession session) {
		final String acc_no = (String)session.getAttribute("AccountNumber");
        Map<String, Double> graphData = new TreeMap<>();
        List<Loan_Trans> ld = TransServ.getUserLoanData(acc_no);
        for (Iterator iterator = ld.iterator(); iterator.hasNext();) {
        	Loan_Trans ld1 = (Loan_Trans) iterator.next();		
			double abc = Double.parseDouble(ld1.getLoanbalance());
			graphData.put(ld1.getDate(), abc);
		}        
        return new ResponseEntity<>(graphData, HttpStatus.OK);
    }
	
	
	@RequestMapping({"user_emergency_loan"})
	public String user_emergency_loan(final Model model,HttpSession session)
	{	
		
		 
		String AccountNumber = (String) session.getAttribute("AccountNumber");
		
		List<EmergencyLoan> emerloan = userservice.GetUserEmergencyLoanDetails(AccountNumber);
		model.addAttribute("emerloan", emerloan);
		
		List<EmeregencyLoanTrans> eltd = TransServ.getUserEmergencyTransLoanData(AccountNumber);
		model.addAttribute("eltd", eltd);
		
		
		return "user_emergency_loan";
	}
	
	@RequestMapping({"user_fd"})
	public String user_fd(final Model model,HttpSession session)
	{	
		try
		 {
			String AccountNumber = (String) session.getAttribute("AccountNumber");							
		 }
		 catch (Exception e) {
			
		}
		
		double TotalAmount = 0;
		 LocalDate today = LocalDate.now();
		 //String Montharr[] = {"JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER"}; 
		String AccountNumber = (String) session.getAttribute("AccountNumber");
		List<FixedDeposite> fd = userservice.getFD(AccountNumber);
		//System.out.println(fd.get(0).getFdamount());
		if(fd.size() > 0)
		{
			String string = fd.get(0).getFddate();
			String string1[] = string.split("-");
			int year =Integer.parseInt(string1[0]);
			int month = Integer.parseInt(string1[1]);
			int date = Integer.parseInt(string1[2]);
			  LocalDate FDDate = LocalDate.of(year, month,date);
			
			  long months =  ChronoUnit.MONTHS.between( FDDate,today);
			  
			  double a  = 0.07;
			  double InterstAmount = a * Double.parseDouble(fd.get(0).getFdamount());
			  InterstAmount = (InterstAmount/12) * months;
			  TotalAmount = InterstAmount + Double.parseDouble(fd.get(0).getFdamount());
			model.addAttribute("Account_Number", fd.get(0).getAccountnumber());
			model.addAttribute("CertificateNumber", fd.get(0).getFdcertificatenumber());
			model.addAttribute("FullName", fd.get(0).getFullname());
			model.addAttribute("FDAmount", fd.get(0).getFdamount());
			model.addAttribute("FDDate", fd.get(0).getFddate());
			model.addAttribute("TotalAmount", Double.toString(TotalAmount));
			model.addAttribute("InterestAmount", fd.get(0).getRoi());
			model.addAttribute("MaturityDate", fd.get(0).getMaturingdate());
			model.addAttribute("FDList", fd);
		}
				
		return "user_fd";
	}
	
	@RequestMapping({"user_rd"})
	public String user_rd(final Model model,HttpSession session)
	{	
		 
		 try
		 {
			String AccountNumber = (String) session.getAttribute("AccountNumber");		
			Add_Member up = amr.finduserprofileByAccountNumber(AccountNumber);			
		 }
		 catch (Exception e) {
			
		}
		 String AccountNumber = (String) session.getAttribute("AccountNumber");
		 
		 List<RecurringDepositeNew> NewRD = userservice.GetAllNewRDInformation(AccountNumber);
		 model.addAttribute("NewRD", NewRD);
		
		
		
		List<RecurringDeposit> rd = userservice.getRD(AccountNumber);
		if(rd.size() > 0)
		{
//			model.addAttribute("Account_Number", rd.get(0).getAccountnumber());
//			model.addAttribute("FullName", rd.get(0).getFullname());
//			model.addAttribute("RDAmount", rd.get(0).getRdamount());
			
//			model.addAttribute("Tenure", rd.get(0).getTenure());
//			model.addAttribute("RDDate", rd.get(0).getRddate());
//			model.addAttribute("MaturingDate", rd.get(0).getMaturingdate());
//			model.addAttribute("Roi", rd.get(0).getRoi());
//			model.addAttribute("TotalAmount", rd.get(0).getTotalamount());
//			model.addAttribute("rddata", rd.get(0).getRddata());
			model.addAttribute("RDList", rd);
		}
		return "user_rd";
	}
	
	@RequestMapping({"user_insurance"})
	public String user_insurance(final Model model,HttpSession session)
	{	
		
		 try
		 {
			String AccountNumber	 = (String) session.getAttribute("AccountNumber");
			//userprofile up = user_pro.finduserprofileByAccountNumber(AccountNumber);
			Add_Member up = amr.finduserprofileByAccountNumber(AccountNumber);
			//String photopath = up.getPhoto();
			//String uploadDir = new ClassPathResource("static/PhotoProfile/").getFile().getAbsolutePath();
			 //Path uploadPath = Paths.get(uploadDir);
			// Path filePath = uploadPath.resolve(photopath);
			//String string123 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/PhotoProfile/").path(photopath).toUriString();
			//System.out.println( "Store File Path:  "+string123);
			//model.addAttribute("PHOTO", string123);
		 }
		 catch (Exception e) {
			// TODO: handle exception
		}
		
		
		String AccountNumber = (String) session.getAttribute("AccountNumber");
		Insurance ins = userservice.GetInsuranceOfUser(AccountNumber);
		List<TransInsurance> InsuranceData = TransServ.getUserInsuranceData(AccountNumber);
		model.addAttribute("InsuranceData", InsuranceData);
		if(ins != null)
		{
			model.addAttribute("Account_Number", ins.getAccountnumber());
			model.addAttribute("FullName", ins.getFullname());
			model.addAttribute("InsuranceAmount", ins.getInsdebt());
			model.addAttribute("Date", ins.getDate());
			model.addAttribute("TotalInsuranceAmount", ins.getTotalinsuranceamount());
			//model.addAttribute("finyear", ins.getFinyear());
			
			
		}
		return "user_insurance";
	}
	
	@RequestMapping({"user_monthly_deposit"})
	public String user_monthly_deposit(final Model model,HttpSession session)
	{	
		
		
		 try
		 {
			String AccountNumber	 = (String) session.getAttribute("AccountNumber");
			//userprofile up = user_pro.finduserprofileByAccountNumber(AccountNumber);
			Add_Member up = amr.finduserprofileByAccountNumber(AccountNumber);
			//String photopath = up.getPhoto();
			//String uploadDir = new ClassPathResource("static/PhotoProfile/").getFile().getAbsolutePath();
			//Path uploadPath = Paths.get(uploadDir);
			// Path filePath = uploadPath.resolve(photopath);
			//String string123 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/PhotoProfile/").path(photopath).toUriString();
			//System.out.println( "Store File Path:  "+string123);
			//model.addAttribute("PHOTO", string123);
		 }
		 catch (Exception e) {
			// TODO: handle exception
		}
		
		
		String AccountNumber = (String) session.getAttribute("AccountNumber");
		MonthlyDeposit md = userservice.getMonthlyDepositeUser(AccountNumber);
		//List<MonthlyDeposit> monthdepo = TransServ.getUserMonthlyDepositData(AccountNumber);
		List<Trans_MonthlyDeposit> monthdepo = TransServ.getUserTransMonthlyDepositData(AccountNumber);
		model.addAttribute("monthdepo", monthdepo);
		
		if(md != null)
		{
			model.addAttribute("Account_Number", md.getAccountnumber());
			model.addAttribute("FullName", md.getFullname());
			model.addAttribute("MDebit", md.getM_debit());
			
			model.addAttribute("MDeposit", md.getM_deposit());
			
			System.out.println(md.getM_debit());
            System.out.println(md.getFullname());
		
		}
		return "user_monthly_deposit";
	}
	
	@RequestMapping({"user_navbar"})
	public String user_navbar(final Model model)
	{
		System.out.println("hello user_navbar");
		List<Notification> ntf = AdminServ.GetAllNotificationInformation();
		model.addAttribute("ntf", ntf);
		return "user_navbar"; 
	}	
	
	@RequestMapping({"user_divi"})
	public String user_divi(final Model model,HttpSession session)
	{	
		
		 try
		 {
			String AccountNumber	 = (String) session.getAttribute("AccountNumber");
			//userprofile up = user_pro.finduserprofileByAccountNumber(AccountNumber);
			Add_Member up = amr.finduserprofileByAccountNumber(AccountNumber);
			//String photopath = up.getPhoto();
			//String uploadDir = new ClassPathResource("static/PhotoProfile/").getFile().getAbsolutePath();
			 //Path uploadPath = Paths.get(uploadDir);
			// Path filePath = uploadPath.resolve(photopath);
			//String string123 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/PhotoProfile/").path(photopath).toUriString();
			//System.out.println( "Store File Path:  "+string123);
			//model.addAttribute("PHOTO", string123);
		 }
		 catch (Exception e) {
			// TODO: handle exception
		}
		
		
		System.out.println("hello user");
		return "user_divi";
	}
	
	
	
	@RequestMapping({"user_regular_loan"})
	public String user_regular_loan(final Model model,HttpSession session)
	{	
	
		String AccountNumber = (String) session.getAttribute("AccountNumber");
		//Loan loan = userservice.GetLoanOfUser(AccountNumber);
		
		List<Loan> RegularLoan = userservice.GetUserRegularLoan(AccountNumber);
		model.addAttribute("RegularLoan", RegularLoan);
		
		List<Loan_Trans> ld = TransServ.getUserLoanData(AccountNumber);
		model.addAttribute("ld", ld);
		
		return "user_regular_loan";
	}
	
	@RequestMapping({"user_share"})
	public String user_share(final Model model,HttpSession session)
	{	
		
		 try
		 {
			String AccountNumber	 = (String) session.getAttribute("AccountNumber");
			//userprofile up = user_pro.finduserprofileByAccountNumber(AccountNumber);
			Add_Member up = amr.finduserprofileByAccountNumber(AccountNumber);
			//String photopath = up.getPhoto();
			//String uploadDir = new ClassPathResource("static/PhotoProfile/").getFile().getAbsolutePath();
			 //Path uploadPath = Paths.get(uploadDir);
			// Path filePath = uploadPath.resolve(photopath);
			//String string123 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/PhotoProfile/").path(photopath).toUriString();
			//System.out.println( "Store File Path:  "+string123);
			//model.addAttribute("PHOTO", string123);
		 }
		 catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		String AccountNumber = (String) session.getAttribute("AccountNumber");
		Share share = userservice.GetShareByuser(AccountNumber);
		List<Trans_Share> UserShareData = TransServ.GetUserShareData(AccountNumber);
		model.addAttribute("ShareData", UserShareData);
		if(share != null)
		{
			model.addAttribute("Account_Number", share.getAccountnumber());
			model.addAttribute("FullName", share.getFullname());
			model.addAttribute("ShareAllot", share.getShareallot());
			
			model.addAttribute("Date", share.getDate());
			model.addAttribute("TotalAmountOfSahre",share.getTotalamountofsahre());
			
			
		}
		
		return "user_share";
	}
	
	
	@RequestMapping({"user_profile"})
	public String user_profile(final Model model,HttpSession session)
	{
		
		 try
		 {
			String AccountNumber = (String) session.getAttribute("AccountNumber");
			//userprofile up = user_pro.finduserprofileByAccountNumber(AccountNumber);
			Add_Member up = amr.finduserprofileByAccountNumber(AccountNumber);
			//String photopath = up.getPhoto();
			//String uploadDir = new ClassPathResource("static/PhotoProfile/").getFile().getAbsolutePath();
			 //Path uploadPath = Paths.get(uploadDir);
			// Path filePath = uploadPath.resolve(photopath);
			//String string123 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/PhotoProfile/").path(photopath).toUriString();
			//System.out.println( "Store File Path:  "+string123);
			//model.addAttribute("PHOTO", string123);
		 }
		 catch (Exception e) {
			// TODO: handle exception
		}
		
		String AccountNumber = (String) session.getAttribute("AccountNumber");
		
		Add_Member profile = userservice.GetAddMemberProfile(AccountNumber);
		
		if(profile != null)
		{
			model.addAttribute("fullname", profile.getFullname());
			model.addAttribute("accountnumber", profile.getAccountnumber());
			model.addAttribute("department", profile.getDepartment());
			model.addAttribute("designation", profile.getDesignation());
			model.addAttribute("dob", profile.getDob());
			model.addAttribute("doj", profile.getDoj());
			model.addAttribute("dor", profile.getDor());
			model.addAttribute("mobile", profile.getMobile());
			model.addAttribute("email", profile.getEmail());
			model.addAttribute("address", profile.getAddress());
			model.addAttribute("shares", profile.getShares());
			model.addAttribute("monthlydeposit", profile.getMonthlydeposit());
			model.addAttribute("insurance", profile.getInsurance());			
			model.addAttribute("bankaccount", profile.getBankaccount());
			model.addAttribute("bankname", profile.getBankname());
			model.addAttribute("branchcode", profile.getBranchcode());
			model.addAttribute("branchname", profile.getBranchname());
			model.addAttribute("nominee", profile.getNominee());
			model.addAttribute("nomineerelation", profile.getNomineerelation());
			model.addAttribute("reg_fee", profile.getReg_fee());
		}
		return "user_profile";
	}
	
	
	@RequestMapping(value = {"save_user_profile"}, method = {RequestMethod.POST},  consumes = "multipart/form-data")
	@ ResponseBody
	public String save_user_profile(HttpServletRequest request)
	{
		String string = "Fail";
		System.out.println("hello");
		//userprofile uf = new userprofile();
		Add_Member uf = new Add_Member();
		uf.setAccountnumber(request.getParameter("AccountNumber"));
		uf.setFullname(request.getParameter("FullName"));
		//uf.set(request.getParameter("mreg_date"));
		uf.setDepartment(request.getParameter("department"));
		uf.setDesignation(request.getParameter("designation"));
		uf.setDob(request.getParameter("dob"));
		uf.setDoj(request.getParameter("doj"));
		//uf.setDo_reg(request.getParameter("do_reg"));
		uf.setMobile(request.getParameter("mobile_no"));
		//uf.setEcontact_no(request.getParameter("econtact_no"));
		uf.setEmail(request.getParameter("email_id"));
		uf.setAddress(request.getParameter("address"));
		//uf.setBank_acc_no(request.getParameter("bank_acc_no"));
		//uf.setBank_name(request.getParameter("bank_name"));
		//uf.setBranch_name(request.getParameter("branch_name"));
		
		
		//userservice.save_user_profile(uf);
		AdminServ.save_member(uf);
		
		
		return string;
	}
	
	
	@RequestMapping(value = {"update_user_profile"},method = {RequestMethod.POST},  consumes = "multipart/form-data")
	@ ResponseBody
	public String update_user_profile(HttpServletRequest request)
	{
		
		String string = "Fail";
		System.out.println("hello save_member");
		
		try
		{
		Add_Member am = new Add_Member();
		
		am.setFullname(request.getParameter("fullname"));
		am.setAccountnumber(request.getParameter("accountnumber"));
		am.setDepartment(request.getParameter("department"));
		am.setDesignation(request.getParameter("designation"));
		am.setDob(request.getParameter("dob"));
		am.setDoj(request.getParameter("doj"));
		am.setDor(request.getParameter("dor"));
		am.setMobile(request.getParameter("mobile"));
		am.setEmail(request.getParameter("email"));
		am.setAddress(request.getParameter("address"));
		am.setShares(request.getParameter("shares"));
		am.setMonthlydeposit(request.getParameter("monthlydeposit"));	
		am.setInsurance(request.getParameter("insurance"));		
		am.setBankaccount(request.getParameter("bankaccount"));
		am.setBankname(request.getParameter("bankname"));
		am.setBranchcode(request.getParameter("branchcode"));
		am.setBranchname(request.getParameter("branchname"));
		am.setNominee(request.getParameter("nominee"));
		am.setNomineerelation(request.getParameter("nomineerelation"));
		am.setReg_fee(request.getParameter("reg_fee"));
		
		
	//	am.setImage1(files.getBytes());	
	//	System.out.println(files.getOriginalFilename());
		
		string = AdminServ.save_member(am);
				
		}
		catch (Exception e) {
			string ="Fail";	
		System.out.println(e);
		}
		
	//	String string123 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/PhotoProfile/").path(files.getOriginalFilename()).toUriString();
	//	System.out.println("localhost :  "+string123);
		return string;
		
		/*
		System.out.println("hello");
		String string = "Fail";
		
		
		userprofile uf = new userprofile();
		
		uf.setAcc_no(request.getParameter("AccountNumber"));
		uf.setFull_name(request.getParameter("FullName"));
		uf.setMreg_date(request.getParameter("mreg_date"));
		uf.setDepartment(request.getParameter("department"));
		uf.setDesignation(request.getParameter("designation"));
		uf.setDob(request.getParameter("dob"));
		uf.setDoj(request.getParameter("doj"));
		uf.setDo_reg(request.getParameter("do_reg"));
		uf.setMobile_no(request.getParameter("mobile_no"));
		uf.setEcontact_no(request.getParameter("econtact_no"));
		uf.setEmail_id(request.getParameter("email_id"));
		uf.setAddress(request.getParameter("address"));
		uf.setBank_acc_no(request.getParameter("bank_acc_no"));
		uf.setBank_name(request.getParameter("bank_name"));
		uf.setBranch_name(request.getParameter("branch_name"));
		uf.setPhoto(files.getOriginalFilename());
		System.out.println(files.getOriginalFilename());
		string = userservice.update_user_profile(uf);
		
		try
		{
		if(files.isEmpty())
		{
		string ="Fail";	
		}
		else
		{
			
			//PhotoProfile
			//String uploadDir = "user-photos/" + request.getParameter("AccountNumber");
			String uploadDir = new ClassPathResource("static/PhotoProfile/").getFile().getAbsolutePath();
			 System.out.println("from update:  "+uploadDir);
		
	        FileUploadUtil.saveFile(uploadDir, files.getOriginalFilename(), files);
			
		}
		}
		catch (Exception e) {
			string ="Fail";	
		System.out.println(e);
		}
		
		String string123 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/PhotoProfile/").path(files.getOriginalFilename()).toUriString();
		System.out.println("localhost :  "+string123);
		return string;
		*/
	}
	
	
	
	@RequestMapping({"loginuser"})
	 @ResponseBody
	public String loginuser( @RequestParam final String acc_no, @RequestParam final String password,HttpSession session)
	{
		String pass = SecuredPass.SecuresPassGenerator(password);
		System.out.println("login pass :   "+pass);
		System.out.println(password);
		String string = userservice.loginvalidate(acc_no,pass);
		System.out.println("return msg: "+string);
		String abc[] = string.split(":");
		String string1 = abc[0];
		String string2 = abc[1];
		
		if(string1.equals("Success"))
		{
							
			Add_Member profile = userservice.GetAddMemberProfile(acc_no);					
			String fullname = profile.getFullname();
			
		session.setAttribute("AccountNumber", acc_no);
		session.setAttribute("User_Name", fullname);
		}
		
////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*		
		try {				
		String phone = "9766017628";
		String username = "Vaibhav";
		String amount = "5000";
		int min = 111111;
		int max = 999999;
		int random_int = (int)Math.floor(Math.random()*(max-min+1)+min);
		String userotp = String.valueOf(random_int);
		session.setAttribute("userotpforgot", userotp);
		System.out.println(random_int+"   "+userotp);
		//String mobile = "9766017628";
		// String otp = "123458";
		System.out.println("Hello SMS:   "+phone);
		//  Dear{#var#},your monthly deduction of {#var#}SOCSRT
		
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.add("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36");
		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
		//String url = "http://sms.bulksmsindia.io/v2/sendSMS?username=societysrtmun&message=Dear ("+username+"),your monthly deduction of ("+random_int+") SOCSRT&sendername=JRupyy&smstype=TRANS&numbers="+phone+"&apikey=362FCECF3CFC4C&peid=1201162938727295780&templateid=1507166073803558008";
		String url = "http://smpp.co.in/app/smsapi/index.php?key=362FCECF3CFC4C&campaign=1&routeid=18&type=text&contacts="+phone+"&senderid=SOCSRT&msg=Dear "+username+", your monthly deduction of "+amount+" SOCSRT&template_id=1507166073803558008";
		ResponseEntity<String> res = rt.exchange(url, HttpMethod.GET, entity, String.class);
		System.out.println(res);				
		} catch (Exception e) {
		System.out.println("Exception :   "+e);
		}
*/
////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		
		return string1;
	}
	
	@RequestMapping(value = { "/User_Password_Update" },method = {RequestMethod.POST})
    @ResponseBody
    public String User_Password_Update(@RequestParam final String acc_no, @RequestParam final String cpassword, final HttpSession session) {
    	
		String string = "Success";
		
	//	  Add_Member us = AdminServ.GetUserName(acc_no);
	//	  String mobile_no = us.getMobile();
		
	//	  int min = 1111;
	//    int max = 9999;
	//    int random_int = (int)Math.floor(Math.random()*(max-min+1)+min);
	//    String userotp = String.valueOf(random_int);
	//    session.setAttribute("userotp", userotp);
	//    System.out.println("Mobile No : "+mobile_no);
	//    System.out.println("OTP : "+random_int);
	    
	    javabeans.setUser_acc_no(acc_no);
	    javabeans.setUser_password(cpassword);
	    
		////////////////////////////////////////////////////////////////////////////////////////////////////////////
				
		try {	
		Add_Member us = AdminServ.GetUserName(acc_no);
		String phone = us.getMobile();			
		int min = 1111;
		int max = 9999;
		int random_int = (int)Math.floor(Math.random()*(max-min+1)+min);
		String userotp = String.valueOf(random_int);
		session.setAttribute("userotp", userotp);		
		System.out.println("Mobile No : "+phone);
	    System.out.println("OTP : "+random_int);
		
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.add("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36"); 
		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
		String url = "http://smpp.co.in/app/smsapi/index.php?key=362FCECF3CFC4C&campaign=1&routeid=18&type=text&contacts="+phone+"&senderid=SOCSRT&msg=Your OTP is "+userotp+" from SOCSRT&template_id=1507166184547177531";
		ResponseEntity<String> res = rt.exchange(url, HttpMethod.GET, entity, String.class);
		System.out.println(res);				
		} catch (Exception e) {
		System.out.println("Exception :   "+e);
		}
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////
	    
/*	    
	   UserSign ureg = new UserSign(); 	
	   String pass = SecuredPass.SecuresPassGenerator(cpassword);
 	  
 	   ureg.setAcc_no(acc_no);
 	   ureg.setPassword(pass); 	   
 	   
 	   System.out.println(acc_no+" "+cpassword);

 	  String string = this.userservice.UpdateUserPassword(ureg);
*/ 	  
 	   return string;
    }
	
	@RequestMapping({"/UserVerifyOTP"})
	@ResponseBody
	    public String UserVerifyOTP(@RequestParam final String otp,final HttpSession session) throws IOException
	    {
		String msg = "";
			try {
				
				String userotp = (String) session.getAttribute("userotp");
				System.out.println(otp+" == "+userotp);
				if(userotp.equals(otp)) {
					msg="Success";
					
					 UserSign ureg = new UserSign(); 	
					   String pass = SecuredPass.SecuresPassGenerator(javabeans.getUser_password());
				 	  
				 	   ureg.setAcc_no(javabeans.getUser_acc_no());
				 	   ureg.setPassword(pass); 	   
				 	   
				 	   System.out.println(javabeans.getUser_acc_no()+" "+javabeans.getUser_password());

				 	  String string = this.userservice.UpdateUserPassword(ureg);
					
				}else {
					msg="Fail";
				}
			     			    
			} catch (Exception e) {
				System.out.println("Exception :   "+e);
			}
			return msg;
	}
	
	@RequestMapping({"/user_save"})
	@ResponseBody
	public String user_save(@RequestParam final String user_name, @RequestParam final String acc_no, @RequestParam final String password)
	{
		System.out.println("inside user save");
		String pass = SecuredPass.SecuresPassGenerator(password);
		System.out.println("register pass:   "+pass);
		UserSign usersign = new UserSign();
		usersign.setName(user_name);
		usersign.setAcc_no(acc_no);
		usersign.setPassword(pass);
		String string = userservice.RegisterUser(usersign);
		return string;
	}
	
	@RequestMapping({"annual_report"})
	public String annual_report()
	{	
		
		
		
		return "annual_report";
	}
	
	@RequestMapping({"user_logout"})
	@ResponseBody
	private String user_logout(HttpSession session)
	{

            session.invalidate();
       
		
	return "Success";	
	}
	
	
	
	
}
