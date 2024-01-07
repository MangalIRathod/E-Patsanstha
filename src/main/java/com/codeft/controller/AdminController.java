package com.codeft.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.URISyntaxException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Vector;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.codeft.Entity.Head;
import com.codeft.Entity.Insurance;
import com.codeft.Entity.Loan;
import com.codeft.Entity.Loan_Amount_Credit;
import com.codeft.Entity.Loan_Closed;
import com.codeft.Entity.Trans.EmeregencyLoanTrans;
import com.codeft.Entity.Trans.Loan_Trans;
import com.codeft.Entity.MonthlyDeposit;
import com.codeft.Entity.Monthly_Emi_Change;
import com.codeft.Entity.Notification;
import com.codeft.Entity.RecurringDeposit;
import com.codeft.Entity.RecurringDepositeNew;
import com.codeft.Entity.Share;
import com.codeft.Entity.Third_Party_Payment;
import com.codeft.Entity.UserAnnualReport;
import com.codeft.Entity.Trans.Trans_Share;
import com.codeft.Entity.UserSign;
import com.codeft.Entity.Pat_Profile;
import com.codeft.Beans.JavaBeans;
import com.codeft.Entity.Add_Member;
import com.codeft.Entity.EmergencyLoan;
import com.codeft.Entity.Emergency_Loan_Close;
import com.codeft.Entity.Emergency_Loan_Credit;
import com.codeft.Entity.FixedDeposite;
import com.codeft.Entity.Close_FD;
import com.codeft.Entity.Close_RD;
import com.codeft.Entity.Dead_Member;
import com.codeft.Entity.Deduction;
import com.codeft.Entity.Deduction_Compare;
import com.codeft.Entity.Dividend_Interest;
import com.codeft.Entity.Dividend;
import com.codeft.Entity.Cancel_Member;
import com.codeft.Entity.Change_Interest;
import com.codeft.Entity.Trans.TransInsurance;
import com.codeft.Entity.Trans.Trans_MonthlyDeposit;
import com.codeft.Repository.EmergencyLoanRepository;
import com.codeft.Repository.FDRepository;
import com.codeft.Repository.LoanRepository;
import com.codeft.Repository.RDNewRepository;
import com.codeft.Repository.RDRepository;
import com.codeft.Repository.Third_Party_Payment_Repository;
import com.codeft.Services.AdminServices;
import com.codeft.Services.TransactionalService;
import com.codeft.Services.UserServices;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

@Controller
public class AdminController {

	JavaBeans javabeans = new JavaBeans();

	@Autowired
	AdminServices AdminServ;

	@Autowired
	UserServices userservice;

	@Autowired
	TransactionalService TransServ;

	@Autowired
	RDRepository RDR;

	@Autowired
	FDRepository FDR;

	@Autowired
	RDNewRepository RDNR;

	@Autowired
	Third_Party_Payment_Repository TPPR;
	
	@Autowired
	LoanRepository LR;
	
	@Autowired
	EmergencyLoanRepository ELR;

	@RequestMapping({ "Admin/Admin_index" })
	public String Admin_index(final Model model) {
		System.out.println("hello Admin");

		////////////////////////////////////
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDateTime now = LocalDateTime.now();
		System.out.println(dtf.format(now));
		String cdate1 = dtf.format(now);
		String cdate[] = cdate1.split("-");
		String bdate = cdate[1] + "-" + cdate[2];
		System.out.println(bdate);

		List<Add_Member> am1 = AdminServ.GetAllMemberBirthdayInformation(bdate);
		model.addAttribute("AddMemberInfo", am1);

		LocalDateTime rdate = now.plusDays(30);
		String dor = dtf.format(rdate);
		System.out.println("Retired Date : " + dor);

		List<Add_Member> am_retd = AdminServ.GetAllMemberRetiredInformation(dor);
		model.addAttribute("am_retd", am_retd);
		///////////////////////////////////

		double rd_total = AdminServ.GetTotalRDInformation();
		double total_rd = Math.round(rd_total);
		model.addAttribute("total_rd", NumberFormat.getCurrencyInstance(new Locale("en", "IN")).format(total_rd));

		double fd_total = AdminServ.GetTotalFDInformation();
		double total_fd = Math.round(fd_total);
		model.addAttribute("total_fd", NumberFormat.getCurrencyInstance(new Locale("en", "IN")).format(total_fd));

		double insurance_total = AdminServ.GetTotalInsuranceInformation();
		double total_insurance = Math.round(insurance_total);
		model.addAttribute("total_insurance",
				NumberFormat.getCurrencyInstance(new Locale("en", "IN")).format(total_insurance));

		double md_total = AdminServ.GetTotalMonthlyDepositInformation();
		double total_md = Math.round(md_total);
		model.addAttribute("total_md", NumberFormat.getCurrencyInstance(new Locale("en", "IN")).format(total_md));

		double share_total = AdminServ.GetTotalShareInformation();
		double total_share = Math.round(share_total);
		model.addAttribute("total_share", NumberFormat.getCurrencyInstance(new Locale("en", "IN")).format(total_share));

		double regular_loan_total = AdminServ.GetTotalRegularLoanInformation();
		double total_regular_loan = Math.round(regular_loan_total);
		model.addAttribute("total_regular_loan",
				NumberFormat.getCurrencyInstance(new Locale("en", "IN")).format(total_regular_loan));

		double remaining_regular_loan_total = AdminServ.GetTotalRemainingRegularLoanInformation();
		double total_remaining_regular_loan = Math.round(remaining_regular_loan_total);
		model.addAttribute("total_remaining_regular_loan",
				NumberFormat.getCurrencyInstance(new Locale("en", "IN")).format(total_remaining_regular_loan));

		double emergency_loan_total = AdminServ.GetTotalEmergencyLoanInformation();
		double total_emergency_loan = Math.round(emergency_loan_total);
		model.addAttribute("total_emergency_loan",
				NumberFormat.getCurrencyInstance(new Locale("en", "IN")).format(total_emergency_loan));

		double remaining_emergency_loan_total = AdminServ.GetTotalRemainingEmergencyLoanInformation();
		double total_remaining_emergency_loan = Math.round(remaining_emergency_loan_total);
		model.addAttribute("total_remaining_emergency_loan",
				NumberFormat.getCurrencyInstance(new Locale("en", "IN")).format(total_remaining_emergency_loan));

		List<Add_Member> am = AdminServ.GetAllMemberInformation();
		int amc = am.size();
		model.addAttribute("amc", amc);

		int closed_account_total = AdminServ.GetTotalClosedAccountInformation();
		int total_closed_account = Math.round(closed_account_total);
		model.addAttribute("total_closed_account", total_closed_account);

		int calceled_account_total = AdminServ.GetTotalCanceledAccountInformation();
		int total_canceled_account = Math.round(calceled_account_total);
		model.addAttribute("total_canceled_account", total_canceled_account);

		return "Admin/Admin_index";
	}

	@RequestMapping({ "Admin/login" })
	public String login() {
		System.out.println("hello Admin");
		return "Admin/login";
	}

	@RequestMapping({ "Admin/forgot_password" })
	public String forgot_password() {
		System.out.println("hello Admin");
		return "Admin/forgot_password";
	}

	@RequestMapping({ "Admin/SearchAccountName" })
	@ResponseBody
	private String SearchAccountName(@RequestParam final String AccountNumber) {
		// System.out.println(AccountNumber);
		String string = "";
		String r_no = "";
		int rdno = 0;
		String firstFourChars = "";
		Add_Member us = null;

		try {
			int nrd = AdminServ.GetRecurringDepositOfNewUserId();
			System.out.println("Total RD : " + nrd);
			rdno = nrd + 1;
			// model.addAttribute("rdno", rdno);
			us = AdminServ.GetUserName(AccountNumber);
		} catch (Exception e) {
			System.out.println(e);
		}
		if (!us.equals(null)) {
			string = us.getFullname();
			String vb = string.replaceAll(" ", "");
			firstFourChars = vb.substring(0, 4);

			r_no = firstFourChars + "/" + rdno + "/" + "2022";
		} else {
			string = "Fail";
		}
		return string + ":" + r_no;
	}

	@RequestMapping({ "Admin/SearchFDAccountName" })
	@ResponseBody
	private String SearchFDAccountName(@RequestParam final String AccountNumber) {
		String string = "";
		Add_Member us = null;
		try {
			us = AdminServ.GetUserName(AccountNumber);
		} catch (Exception e) {
			System.out.println(e);
		}
		if (!us.equals(null)) {
			string = us.getFullname();
		} else {
			string = "Fail";
		}
		return string;
	}

	@RequestMapping({ "Admin/AddInsuranceAmount" })
	@ResponseBody
	private String AddInsuranceAmount(@RequestParam final String AccountNumber,
			@RequestParam final String InsuranceAmount, @RequestParam final String TotalAmount,
			@RequestParam final String FullName, @RequestParam final String Date) {

		String string = "";
		String accno = "";
		String insamt = "";
		try {
			Insurance uins = userservice.GetInsuranceOfUser(AccountNumber);
			accno = uins.getAccountnumber();
			insamt = uins.getInsdebt();
		} catch (Exception e) {
			System.out.println(e);
		}

		if (accno.equals(AccountNumber)) {
			Insurance ins = new Insurance();
			ins.setAccountnumber(AccountNumber);
			ins.setFullname(FullName);
			ins.setInsdebt(insamt);
			ins.setDate(Date);
			ins.setTotalinsuranceamount(TotalAmount);
			string = AdminServ.SaveInsuranceOfUser(ins);
		} else {
			Insurance ins = new Insurance();
			ins.setAccountnumber(AccountNumber);
			ins.setFullname(FullName);
			ins.setInsdebt(InsuranceAmount);
			ins.setDate(Date);
			ins.setTotalinsuranceamount(TotalAmount);
			string = AdminServ.SaveInsuranceOfUser(ins);
		}
		TransInsurance TRI = new TransInsurance();
		TRI.setAccountnumber(AccountNumber);
		TRI.setFullname(FullName);
		TRI.setDate(Date);
		TRI.setInsdebt(InsuranceAmount);
		TRI.setTotalinsuranceamount(TotalAmount);
		TransServ.SaveInsurance(TRI);
		return string;
	}

	@RequestMapping(value = { "Admin/AddShares" }, method = { RequestMethod.POST })
	@ResponseBody
	private String AddShares(@RequestParam final String AccountNumber, @RequestParam final String FullName,
			@RequestParam final String ShareAmount, @RequestParam final String Date,
			@RequestParam final String TotalShareAmount) {
		String string = "";
		String accno = "";
		String shareallot = "";
		try {
			Share shared = userservice.GetShareByuser(AccountNumber);

			accno = shared.getAccountnumber();
			shareallot = shared.getShareallot();
		} catch (Exception e) {
			System.out.println(e);
		}

		if (accno.equals(AccountNumber)) {
			Share share = new Share();
			share.setAccountnumber(AccountNumber);
			share.setFullname(FullName);
			share.setShareallot(shareallot);
			share.setDate(Date);
			share.setTotalamountofsahre(TotalShareAmount);
			string = AdminServ.SaveShare(share);
		} else {
			Share share = new Share();
			share.setAccountnumber(AccountNumber);
			share.setFullname(FullName);
			share.setShareallot(ShareAmount);
			share.setDate(Date);
			share.setTotalamountofsahre(TotalShareAmount);
			string = AdminServ.SaveShare(share);
		}

		Trans_Share Tshare = new Trans_Share();
		Tshare.setAccountnumber(AccountNumber);
		Tshare.setFullname(FullName);
		Tshare.setShareallot(ShareAmount);
		Tshare.setDate(Date);
		Tshare.setTotalamountofshare(TotalShareAmount);
		String string1 = TransServ.SaveShare(Tshare);
		return string;
	}

	@RequestMapping(value = { "Admin/AddMonthlyDeposit" }, method = { RequestMethod.POST })
	@ResponseBody
	private String AddMonthlyDeposit(@RequestParam final String accountnumber, @RequestParam final String fullname,
			@RequestParam final String m_debit, @RequestParam final String cdate,
			@RequestParam final String m_deposit) {
		String string = "";
		String month_debit = "";
		String aac_no = "";
		MonthlyDeposit md = null;
		try {
			md = userservice.getMonthlyDepositeUser(accountnumber);
			aac_no = md.getAccountnumber();
			month_debit = md.getM_debit();
			System.out.println("Account Number : " + aac_no);
		} catch (Exception e) {
			System.out.println(e);
		}
		MonthlyDeposit m_deposit_data = new MonthlyDeposit();

		if (aac_no.equals(accountnumber)) {
			m_deposit_data.setAccountnumber(accountnumber);
			m_deposit_data.setFullname(fullname);
			m_deposit_data.setM_debit(month_debit);
			m_deposit_data.setCdate(cdate);
			m_deposit_data.setM_deposit(m_deposit);
			string = AdminServ.SaveMonthlyDeposit(m_deposit_data);
		} else {
			m_deposit_data.setAccountnumber(accountnumber);
			m_deposit_data.setFullname(fullname);
			m_deposit_data.setM_debit(m_debit);
			m_deposit_data.setCdate(cdate);
			m_deposit_data.setM_deposit(m_deposit);
			string = AdminServ.SaveMonthlyDeposit(m_deposit_data);
		}
		Trans_MonthlyDeposit t_monthly_data = new Trans_MonthlyDeposit();
		t_monthly_data.setAccountnumber(accountnumber);
		t_monthly_data.setFullname(fullname);
		t_monthly_data.setM_debit(m_debit);
		t_monthly_data.setCdate(cdate);
		t_monthly_data.setM_deposit(m_deposit);
		String string1 = TransServ.SaveTransMonthlyDeposit(t_monthly_data);

		return string;
	}

	@RequestMapping({ "Admin/GetTotaInsuranceAmount" })
	@ResponseBody
	private String GetTotaInsuranceAmount(@RequestParam final String AccountNumber,
			@RequestParam final String InsuranceAmount) {
		String string = "";
		try {
			Insurance ins = userservice.GetInsuranceOfUser(AccountNumber);
			String PrevInsuranceAmount = ins.getTotalinsuranceamount();
			double CurrentInsuranceAmount = Double.parseDouble(PrevInsuranceAmount)
					+ Double.parseDouble(InsuranceAmount);
			string = Double.toString(CurrentInsuranceAmount);
		} catch (Exception e) {
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping({ "Admin/GetTotalShareAmount" })
	@ResponseBody
	private String GetTotalShareAmount(@RequestParam final String AccountNumber,
			@RequestParam final String ShareAmount) {
		String string = "";
		try {
			Share share = userservice.GetShareByuser(AccountNumber);
			String TotalAmountShare = share.getTotalamountofsahre();
			double CurrentTotalAmountShare = Double.parseDouble(TotalAmountShare) + Double.parseDouble(ShareAmount);
			string = Double.toString(CurrentTotalAmountShare);
		} catch (Exception e) {
			System.out.println(e);
		}
		return string;
	}

	@RequestMapping({ "Admin/GetTotalMonthlyDepositAmount" })
	@ResponseBody
	private String GetTotalMonthlyDepositAmount(@RequestParam final String AccountNumber,
			@RequestParam final String m_debit) {
		String string = "";
		try {
			MonthlyDeposit monthly_deposit = userservice.getMonthlyDepositeUser(AccountNumber);
			String TotalMonthly_Deposit = monthly_deposit.getM_deposit();
			double CurrentTotalAmountDeposit = Double.parseDouble(TotalMonthly_Deposit) + Double.parseDouble(m_debit);
			string = Double.toString(CurrentTotalAmountDeposit);
		} catch (Exception e) {
			System.out.println(e);
		}
		return string;
	}

	@RequestMapping(value = { "Admin/AddRD" }, method = { RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	private String AddRD(HttpServletRequest request,
			@RequestParam(value = "files", required = false) MultipartFile files) throws IOException {

		double rdn = AdminServ.GetRecurringDepositOfNewUser(request.getParameter("AccountNumber"));

		String string = "Fail";
		String string1 = "Fail";
		// System.out.println(files.getOriginalFilename());
		// System.out.println(request.getParameter("AccountNumber"));
		// String UploadDIRPath = new
		// ClassPathResource("static/RD/").getFile().getAbsolutePath();;
		// System.out.println(UploadDIRPath);
		RecurringDeposit RD = new RecurringDeposit();
		RD.setAccountnumber(request.getParameter("AccountNumber"));
		RD.setFullname(request.getParameter("FullName"));
		RD.setRdamount(Double.parseDouble(request.getParameter("RDAmount")));
		RD.setRddate(request.getParameter("RDDate"));
		// RD.setMaturingdate(request.getParameter("MDate"));
		// RD.setTotalamount(request.getParameter("RDAmount"));
		RD.setTotalamount("0");
		RD.setStatus("start");
		// if(!files.isEmpty()) {
		// System.out.println("Hello "+files.getBytes());

		// }
		// RD.setRd_no(request.getParameter("rd_no"));
		string = AdminServ.SaveRDInfo(RD);

		double rdamt = Double.parseDouble(request.getParameter("RDAmount")) + rdn;

		RecurringDepositeNew RDN = new RecurringDepositeNew();
		RDN.setAccno(request.getParameter("AccountNumber"));
		RDN.setName(request.getParameter("FullName"));
		RDN.setRdamt(request.getParameter("RDAmount"));
		RDN.setRoi(request.getParameter("ROI"));
		RDN.setStartdate(request.getParameter("RDDate"));
		RDN.setEnddate(request.getParameter("MDate"));
		// RDN.setTotamt(request.getParameter("RDAmount"));
		RDN.setTotamt("0");
		RDN.setStatus("start");
		RDN.setRd_no(request.getParameter("rd_no"));

		try {
			RDN.setRddata(files.getBytes());
		} catch (Exception e) {
			System.out.println(e);
		}
		// RDN.setTotal_rd_amt(request.getParameter("RDAmount"));
		RDN.setTotal_rd_amt(String.valueOf(rdamt));
		string1 = AdminServ.save_new_rd(RDN);

		return string;
	}

	@RequestMapping(value = { "Admin/DownloadRDDocument" }, method = { RequestMethod.GET })
	private ResponseEntity<ByteArrayResource> DownloadRDDocument(HttpServletRequest request,
			HttpServletResponse response) throws IOException, URISyntaxException {
		String string = "Success";
		RecurringDepositeNew RD = null;
		String AccountNumber = request.getParameter("AccountNumber");
		System.out.println(AccountNumber);
		RD = AdminServ.GetRDDocument(AccountNumber);
		try {
			RD = AdminServ.GetRDDocument(AccountNumber);
		} catch (Exception e) {
			System.out.println(e);
			string = "Fail";
		}
		return ResponseEntity.ok().contentType(MediaType.APPLICATION_OCTET_STREAM)
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment:filename=\"" + RD.getRddata() + "\"")
				.body(new ByteArrayResource(RD.getRddata()));
	}

	@RequestMapping(value = { "Admin/DownloadFDDocument" }, method = { RequestMethod.GET })
	private ResponseEntity<ByteArrayResource> DownloadFDDocument(HttpServletRequest request,
			HttpServletResponse response) throws IOException, URISyntaxException {
		String string = "Success";
		FixedDeposite FD = null;
		String AccountNumber = request.getParameter("AccountNumber");
		System.out.println(AccountNumber);
		FD = AdminServ.GetFDDocument(AccountNumber);

		return ResponseEntity.ok().contentType(MediaType.APPLICATION_OCTET_STREAM)
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment:filename=\"" + FD.getDocument() + "\"")
				.body(new ByteArrayResource(FD.getDocument()));
	}

	@RequestMapping(value = { "Admin/DownloadNewLoanDocument" }, method = { RequestMethod.GET })
	private ResponseEntity<ByteArrayResource> DownloadNewLoanDocument(HttpServletRequest request,
			HttpServletResponse response) throws IOException, URISyntaxException {
		String string = "Success";
		Loan ln = null;
		String AccountNumber = request.getParameter("AccountNumber");
		System.out.println(AccountNumber);
		ln = AdminServ.GetNewLoanDocument(AccountNumber);

		return ResponseEntity.ok().contentType(MediaType.APPLICATION_OCTET_STREAM)
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment:filename=\"" + ln.getDocument() + "\"")
				.body(new ByteArrayResource(ln.getDocument()));
	}

	@RequestMapping(value = { "Admin/DownloadLoanAmountCreditDocument" }, method = { RequestMethod.GET })
	private ResponseEntity<ByteArrayResource> DownloadLoanAmountCreditDocument(HttpServletRequest request,
			HttpServletResponse response) throws IOException, URISyntaxException {
		String string = "Success";
		Loan_Amount_Credit lac = null;
		String AccountNumber = request.getParameter("AccountNumber");
		System.out.println(AccountNumber);
		lac = AdminServ.GetLoanAmountCreditDocument(AccountNumber);

		return ResponseEntity.ok().contentType(MediaType.APPLICATION_OCTET_STREAM)
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment:filename=\"" + lac.getDocument() + "\"")
				.body(new ByteArrayResource(lac.getDocument()));
	}

	@RequestMapping(value = { "Admin/DownloadEmergencyLoanDocument" }, method = { RequestMethod.GET })
	private ResponseEntity<ByteArrayResource> DownloadEmergencyLoanDocument(HttpServletRequest request,
			HttpServletResponse response) throws IOException, URISyntaxException {
		String string = "Success";
		EmergencyLoan el = null;
		String AccountNumber = request.getParameter("AccountNumber");
		System.out.println(AccountNumber);
		el = AdminServ.GetEmergencyLoanDocument(AccountNumber);

		return ResponseEntity.ok().contentType(MediaType.APPLICATION_OCTET_STREAM)
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment:filename=\"" + el.getDocument() + "\"")
				.body(new ByteArrayResource(el.getDocument()));
	}

	/*
	 * @RequestMapping(value = {"Admin/DownloadAddMemberDocument"},method =
	 * {RequestMethod.GET}) private ResponseEntity<ByteArrayResource>
	 * DownloadAddMemberDocument(HttpServletRequest request,HttpServletResponse
	 * response) throws IOException, URISyntaxException { String string = "Success";
	 * Add_Member am = null; String AccountNumber =
	 * request.getParameter("AccountNumber"); System.out.println(AccountNumber); am
	 * = AdminServ.GetAddMemberDocument(AccountNumber);
	 * 
	 * return ResponseEntity.ok() .contentType(MediaType.APPLICATION_OCTET_STREAM)
	 * .header(HttpHeaders.CONTENT_DISPOSITION,
	 * "attachment:filename=\""+am.getImage1()+"\"") .body(new
	 * ByteArrayResource(am.getImage1())); }
	 */

	@RequestMapping(value = { "Admin/DownloadLoanCloseDocument" }, method = { RequestMethod.GET })
	private ResponseEntity<ByteArrayResource> DownloadLoanCloseDocument(HttpServletRequest request,
			HttpServletResponse response) throws IOException, URISyntaxException {
		String string = "Success";
		Loan_Closed lc = null;
		String AccountNumber = request.getParameter("AccountNumber");
		System.out.println(AccountNumber);
		lc = AdminServ.GetLoanClosedDocument(AccountNumber);

		return ResponseEntity.ok().contentType(MediaType.APPLICATION_OCTET_STREAM)
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment:filename=\"" + lc.getDocument() + "\"")
				.body(new ByteArrayResource(lc.getDocument()));
	}

	@RequestMapping("Admin/AddHeadName")
	@ResponseBody
	private String AddHeadName(@RequestParam final String HeadName) {
		Head head = new Head();
		head.setName(HeadName);
		String string = AdminServ.SaveHeadName(head);
		return "";
	}

	@RequestMapping("Admin/Add_Third_Party_Payment")
	@ResponseBody
	private String Add_Third_Pary_Payment(@RequestParam final String party_name, @RequestParam final String amount,
			@RequestParam final String date, @RequestParam final String cheque_number,@RequestParam final String receipt_number,
			@RequestParam final String transaction, @RequestParam final String notes,
			@RequestParam final String accountNumber) {
		Third_Party_Payment tpp = new Third_Party_Payment();
		double closingbalance = TPPR.getClosingBalance();
		String string = "";

		if(party_name.equals("नियमित कर्ज़ वाटप"))
		{
			LR.setLoanStatus(accountNumber);
			
		}
		
		if(party_name.equals("अल्प कर्ज़ वाटप"))
		{
			
			ELR.setELoanStatus(accountNumber);
		}
		
		
		
		tpp.setParty_name(party_name);
		tpp.setAmount(amount);
		tpp.setDate(date);
		tpp.setCheque_number(cheque_number);
		tpp.setReceipt_number(receipt_number);
		tpp.setTransaction(transaction);
		tpp.setNotes(notes);
		tpp.setAccountnumber(accountNumber);

		// tpp.setOpeningbalance(OpeningBalaance);
		if (transaction.equals("Debit")) {
			closingbalance = closingbalance - Double.parseDouble(amount);

		}
		if (transaction.equals("Credit")) {
			closingbalance = closingbalance + Double.parseDouble(amount);
		}

		if (closingbalance > 0) {
			tpp.setClosingbalance(new BigDecimal(closingbalance).toPlainString());
			double OpeningBalance = TPPR.getOpeningBalance();
			String OB = new BigDecimal(OpeningBalance).toPlainString();
			tpp.setOpeningbalance(OB);
			string = AdminServ.SaveThirdPartyDetails(tpp);

		} else
			string = "closing balance must be positive";
		return string;
	}

	@RequestMapping("Admin/Add_Notification")
	@ResponseBody
	private String Add_Notification(@RequestParam final String title, @RequestParam final String cdate,
			@RequestParam final String description) {
		Notification ntf = new Notification();
		ntf.setTitle(title);
		ntf.setCdate(cdate);
		ntf.setDescription(description);

		String string = AdminServ.SaveNotificationDetails(ntf);
		return string;
	}

	@RequestMapping("Admin/DeleteThirdParty")
	@ResponseBody
	private String DeleteThirdParty(@RequestParam final int id) {
		String string = this.AdminServ.DeleteThirdPartyPayment(id);

		return "Success";
	}

	@RequestMapping("Admin/DeleteRegularLoan")
	@ResponseBody
	private String DeleteRegularLoan(@RequestParam final int id, @RequestParam final String accountnumber) {
		String string = this.AdminServ.DeleteRegularLoanTrans(id);
		String string1 = this.AdminServ.DeleteRegularLoan(accountnumber);
		return "Success";
	}

	@RequestMapping("Admin/DeleteFD")
	@ResponseBody
	private String DeleteFD(@RequestParam final int id) {
		String string = this.AdminServ.DeleteFD(id);
		return "Success";
	}

	@RequestMapping("Admin/DeleteRD")
	@ResponseBody
	private String DeleteRD(@RequestParam final int id) {
		String string = this.AdminServ.DeleteRD(id);
		return "Success";
	}

	@RequestMapping("Admin/DeleteEmergencyLoan")
	@ResponseBody
	private String DeleteEmergencyLoan(@RequestParam final int id, @RequestParam final String accountnumber) {
		String string = this.AdminServ.DeleteEmergencyLoanTrans(id);
		String string1 = this.AdminServ.DeleteEmergencyLoan(accountnumber);
		return "Success";
	}

	@RequestMapping("Admin/Delete_Notification")
	@ResponseBody
	private String Delete_Notification(@RequestParam final int id) {
		String string = this.AdminServ.DeleteNotification(id);

		return "Success";
	}

	@RequestMapping("Admin/DeleteAccountHead")
	@ResponseBody
	private String DeleteAccountHead(@RequestParam final int id) {
		String string = this.AdminServ.DeleteAccountHead(id);

		return "Success";
	}

	@RequestMapping({ "Admin/Terij_patrak_print" })
	public String Terij_patrak_print(final Model model) {
		System.out.println("hello Terij_patrak_print");
		LinkedHashMap<String, String> Terij1 = JavaBeans.getTerijPatrakData().get(0);

		LinkedHashMap<String, String> Terij2 = JavaBeans.getTerijPatrakData().get(1);

		model.addAttribute("terij", Terij1);

		model.addAttribute("terij1", Terij2);

		return "Admin/Terij_patrak_print";
	}

	@RequestMapping({ "Admin/Nafatota_patrak_print" })
	public String Nafatota_patrak_print() {
		System.out.println("hello Nafatota_patrak_print");
		return "Admin/Nafatota_patrak_print";
	}

	@RequestMapping({ "Admin/Taleband_patrak_print" })
	public String Taleband_patrak_print() {
		System.out.println("hello Taleband_patrak_print");
		return "Admin/Taleband_patrak_print";
	}

	@RequestMapping({ "Admin/Andaj_patrak_print" })
	public String Andaj_patrak_print() {
		System.out.println("hello Andaj_patrak_print");
		return "Admin/Andaj_patrak_print";
	}

	@RequestMapping({ "Admin/Terij_patrak" })
	public String Terij_patrak() {
		System.out.println("hello Terij_patrak");
		return "Admin/Terij_patrak";
	}

	@RequestMapping({ "Admin/Nafatota_patrak" })
	public String Nafatota_patrak() {
		System.out.println("hello Nafatota_patrak");
		return "Admin/Nafatota_patrak";
	}

	@RequestMapping({ "Admin/Taleband_patrak" })
	public String Taleband_patrak() {
		System.out.println("hello Taleband_patrak");
		return "Admin/Taleband_patrak";
	}

	@RequestMapping({ "Admin/admin_annual_report" })
	public String admin_annual_report() {
		
		System.out.println("hello admin_annual_report");
		return "Admin/admin_annual_report";
	}

	@RequestMapping(value = { "Admin/admin_annual_report_Fetch" },method = {RequestMethod.POST},consumes = "multipart/form-data")
@ResponseBody
	public String admin_annual_report_Fetch(HttpServletRequest request) {

		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		List<UserAnnualReport> userrepoert = AdminServ.FetchAnnualReport(sdate, edate);
		JavaBeans.setUseranReprt(userrepoert);
		return "Success";
	}

	@RequestMapping({ "Admin/Andaj_patrak" })
	public String Andaj_patrak() {
		System.out.println("hello Andaj_patrak");
		return "Admin/Andaj_patrak";
	}

	@RequestMapping(value = { "Admin/terij_patrak_report" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String terij_patrak_report(HttpServletRequest request) {
		String string = "Success";

		// List<EmeregencyLoanTrans> emergency_loan_details =
		// AdminServ.emergency_loan_Report_Details(request.getParameter("accountnumber"),
		// request.getParameter("sdate"), request.getParameter("edate"));
		// javabeans.setEmergency_loan_details(emergency_loan_details);

		javabeans.setBalansheet_date(request.getParameter("sdate") + " To " + request.getParameter("edate"));
		Vector<LinkedHashMap<String, String>> TerijPatrakData = AdminServ
				.GetTerijPatrakInfo(request.getParameter("sdate"), request.getParameter("edate"));
		JavaBeans.setTerijPatrakData(TerijPatrakData);
		System.out.println("terij patrak data:  " + TerijPatrakData);
		return string;
	}

	@RequestMapping(value = { "Admin/nafatota_patrak_report" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String nafatota_patrak_report(HttpServletRequest request) {
		String string = "Success";

		// List<EmeregencyLoanTrans> emergency_loan_details =
		// AdminServ.emergency_loan_Report_Details(request.getParameter("accountnumber"),
		// request.getParameter("sdate"), request.getParameter("edate"));
		// javabeans.setEmergency_loan_details(emergency_loan_details);
		javabeans.setBalansheet_date(request.getParameter("sdate") + " To " + request.getParameter("edate"));

		return string;
	}

	@RequestMapping(value = { "Admin/taleband_patrak_report" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String taleband_patrak_report(HttpServletRequest request) {
		String string = "Success";

		// List<EmeregencyLoanTrans> emergency_loan_details =
		// AdminServ.emergency_loan_Report_Details(request.getParameter("accountnumber"),
		// request.getParameter("sdate"), request.getParameter("edate"));
		// javabeans.setEmergency_loan_details(emergency_loan_details);
		javabeans.setBalansheet_date(request.getParameter("sdate") + " To " + request.getParameter("edate"));

		return string;
	}

	@RequestMapping(value = { "Admin/andaj_patrak_report" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String andaj_patrak_report(HttpServletRequest request) {
		String string = "Success";

		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");

		return string;
	}

	@RequestMapping({ "Admin/Account_Update" })
	public String Account_Update() {
		System.out.println("hello Admin");
		return "Admin/Account_Update";
	}

	@RequestMapping({ "Admin/add_account_head" })
	public String add_account_head(final Model model) {
		System.out.println("hello add_account_head");

		List<Head> hn = AdminServ.GetAllHeadName();
		model.addAttribute("hn", hn);

		return "Admin/add_account_head";
	}

	@RequestMapping({ "Admin/Add_Account" })
	public String Add_Account() {
		System.out.println("hello Admin");
		return "Admin/Add_Account";
	}

	@RequestMapping({ "Admin/deduction_compare" })
	public String deduction_compare() {
		System.out.println("hello deduction_compare");
		return "Admin/deduction_compare";
	}

	@RequestMapping({ "Admin/Add_Member" })
	public String Add_Member(final Model model) {
		System.out.println("hello Admin");
		List<Add_Member> am = AdminServ.GetAllMemberInformation();
		model.addAttribute("AddMemberInfo", am);
		return "Admin/Add_Member";
	}

	@RequestMapping({ "Admin/Add_FD" })
	public String Add_FD(final Model model) {
		System.out.println("hello Admin");
		List<FixedDeposite> FD = AdminServ.GetAllFDInformation();
		// List<FixedDeposite> FD = AdminServ.Add_FD_Details();
		int amc = FD.size();
		System.out.println("Total FD : " + amc);
		int fdno = amc + 1;
		String fdc = "FD/SOC/2022/" + fdno;
		model.addAttribute("fdc", fdc);
		model.addAttribute("FDInfo", FD);
		return "Admin/Add_FD";
	}

	@RequestMapping({ "Admin/add_insurance" })
	public String add_insurance(final Model model) {
		List<TransInsurance> ALLUserIns = TransServ.GetAllUserInsurance();
		model.addAttribute("AllUserIns", ALLUserIns);
		return "Admin/add_insurance";
	}

	@RequestMapping({ "Admin/Add_RD" })
	public String Add_RD(final Model model) {
		System.out.println("hello AddRD");
		// List<RecurringDepositeNew> NewRD = AdminServ.GetAllNewRDInformation();
		// List<FixedDeposite> FD = AdminServ.Add_FD_Details();
		// int nrd = NewRD.size();
//		int nrd = AdminServ.GetRecurringDepositOfNewUserId();		
//		System.out.println("Total RD : "+nrd);
//		int rdno = nrd+1;		
//		model.addAttribute("rdno", rdno);

		List<RecurringDeposit> RD = AdminServ.GetAllRDInformation();
		model.addAttribute("RDInfo", RD);
		return "Admin/Add_RD";
	}

	@RequestMapping({ "Admin/add_third_party" })
	public String add_third_party(final Model model) {
		double credit_sum = 0.0;
		double debit_sum = 0.0;
		System.out.println("hello Admin in third party");
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		// LocalDateTime now = LocalDateTime.now();
		LocalDate now = LocalDate.now();
		String CDate1 = dtf.format(now);
		now = now.minusDays(1);
		String CDate = dtf.format(now);
		System.out.println(CDate);
		List<Head> hn = AdminServ.GetAllHeadName();
		model.addAttribute("hn", hn);

		List<Third_Party_Payment> tpp = AdminServ.GetAllThirdPartyDetails();
		model.addAttribute("tpp", tpp);

//Third_Party_Payment OpeningBalance =		tpp.stream().filter(Third_Party_Payment -> Third_Party_Payment.getDate().equals(CDate)).reduce((first, second) -> second).get();    //findFirst().get(); 

		double OpeningBalance = TPPR.getOpeningBalance();

		Third_Party_Payment closingBalance = tpp.stream().skip(tpp.size() - 1).findFirst().get();
		try {
			credit_sum = TPPR.getCreditSum(CDate1);
		} catch (Exception e) {
			credit_sum = 0.0;
		}

		try {
			debit_sum = TPPR.getDebitSum(CDate1);
		} catch (Exception e) {
			debit_sum = 0.0;
		}
		System.out.println(credit_sum + "   " + debit_sum);
		String OB = new BigDecimal(OpeningBalance).toPlainString();
		model.addAttribute("openingBalance", OB);
		model.addAttribute("ClosingBalance", closingBalance.getClosingbalance());
		model.addAttribute("credit", credit_sum);
		model.addAttribute("debit", debit_sum);

		System.out.println(OpeningBalance + "   closing Balance:  " + closingBalance.getClosingbalance());
		return "Admin/add_third_party";
	}

	@RequestMapping({ "Admin/Cancel_Member" })
	public String Cancel_Member(final Model model) {
		System.out.println("hello Admin");
		List<Cancel_Member> AllCancelMember = AdminServ.GetAllCancelMemberInformation();
		model.addAttribute("AllCancelMember", AllCancelMember);
		return "Admin/Cancel_Member";
	}

	@RequestMapping({ "Admin/Change_Interest" })
	public String Change_Interest(final Model model) {
		System.out.println("hello Change_Interest");
		List<Change_Interest> ci = AdminServ.GetAllChangeInterestInformation();
		model.addAttribute("ChangeInterestInfo", ci);
		return "Admin/Change_Interest";
	}

	@RequestMapping({ "Admin/Dividend_Interest" })
	public String Dividend_Interest(final Model model) {
		System.out.println("hello Dividend_Interest");
		List<Dividend_Interest> di = AdminServ.GetAllDividendInterestInformation();
		model.addAttribute("DividendInterestInfo", di);
		return "Admin/Dividend_Interest";
	}

	@RequestMapping({ "Admin/Dividend" })
	public String Dividend(final Model model) {
		System.out.println("hello Dividend");

		String string1 = AdminServ.FindAllDividendInterestInformation();

		String interest[] = string1.split(":");

		// System.out.println("Dividend_Interest : "+interest[0]+" "+interest[1]);
		List<Dividend> dividend_details = AdminServ.GetAllDividendDetails(interest[0], interest[1]);
		model.addAttribute("dividend_details", dividend_details);
		return "Admin/Dividend";
	}

	@RequestMapping({ "Admin/Close_FD" })
	public String Close_FD(final Model model) {
		System.out.println("hello Admin");
		// List<Close_FD> FD = AdminServ.GetAllCloseFDInformation();
		// model.addAttribute("CloseFDInfo", FD);

		List<Change_Interest> ci = AdminServ.GetAllChangeInterestInformation();
		model.addAttribute("ChangeInterestInfo", ci);

		List<FixedDeposite> FD = javabeans.getFixed_depo();
		model.addAttribute("CloseFDInfo", FD);
		return "Admin/Close_FD";
	}

	@RequestMapping({ "Admin/Close_Loan" })
	public String Close_Loan(final Model model) {
		System.out.println("hello Admin");
		List<Loan_Closed> lc = AdminServ.GetAllCloseLoanInformation();
		model.addAttribute("CloseLoanInfo", lc);
		return "Admin/Close_Loan";
	}

	@RequestMapping({ "Admin/Close_RD" })
	public String Close_RD(final Model model) {
		System.out.println("hello Admin");
		// List<Close_RD> RD = AdminServ.GetAllCloseRDInformation();
		// model.addAttribute("CloseRDInfo", RD);
		// List<RecurringDeposit> RD = javabeans.getRecurring_depo();
		// model.addAttribute("CloseRDInfo", RD);

		List<Change_Interest> ci = AdminServ.GetAllChangeInterestInformation();
		model.addAttribute("ChangeInterestInfo", ci);

		List<RecurringDepositeNew> rdn = javabeans.getNew_recurring_deposit_details();
		model.addAttribute("rdn", rdn);
		return "Admin/Close_RD";
	}

	@RequestMapping({ "Admin/credit" })
	public String credit() {
		System.out.println("hello Admin");
		return "Admin/credit";
	}

	@RequestMapping({ "Admin/Notification" })
	public String Notification(final Model model) {
		System.out.println("hello Notification");
		List<Notification> ntf = AdminServ.GetAllNotificationInformation();
		model.addAttribute("ntf", ntf);
		return "Admin/Notification";
	}

	@RequestMapping({ "Admin/Dead_Member" })
	public String Dead_Member(final Model model) {
		System.out.println("hello Admin");
		List<Dead_Member> AllDeadMember = AdminServ.GetAllDeadMemberInformation();
		model.addAttribute("AllDeadMember", AllDeadMember);
		return "Admin/Dead_Member";
	}

	@RequestMapping({ "Admin/emergency_loan_close" })
	public String emergency_loan_close(final Model model) {
		System.out.println("hello Admin");
		List<Emergency_Loan_Close> elc = AdminServ.GetAllEmergencyLoanCloseInformation();
		model.addAttribute("EmergencyLoanCloseInfo", elc);
		return "Admin/emergency_loan_close";
	}

	@RequestMapping({ "Admin/emergency_loan_credit" })
	public String emergency_loan_credit(final Model model) {
		System.out.println("hello Admin");
		List<Emergency_Loan_Credit> elc = AdminServ.GetAllEmergencyLoanCreditInformation();
		model.addAttribute("EmergencyLoanCreditInfo", elc);
		return "Admin/emergency_loan_credit";
	}

	@RequestMapping({ "Admin/Emergency_Loan_Close_Report" })
	public String Emergency_Loan_Close_Report() {
		System.out.println("hello Emergency_Loan_Close_Report");
		return "Admin/Emergency_Loan_Close_Report";
	}

	@RequestMapping({ "Admin/Loan_Close_Report" })
	public String Loan_Close_Report() {
		System.out.println("hello Loan_Close_Report");
		return "Admin/Loan_Close_Report";
	}

	@RequestMapping({ "Admin/Emergency_Loan_Report" })
	public String Emergency_Loan_Report() {
		System.out.println("hello Admin");
		return "Admin/Emergency_Loan_Report";
	}

	@RequestMapping({ "Admin/Emergency_Loan_Report_Print" })
	public String Emergency_Loan_Report_Print(final Model model) {
		System.out.println("hello Emergency_Loan_Report_Print");

		String emergency_loan_date = javabeans.getEmergency_loan_date();
		model.addAttribute("emergency_loan_date", emergency_loan_date);

		List<EmeregencyLoanTrans> emergency_loan_details = javabeans.getEmergency_loan_details();
		model.addAttribute("emergency_loan_details", emergency_loan_details);

		return "Admin/Emergency_Loan_Report_Print";
	}

	@RequestMapping({ "Admin/Emergency_Loan_Close_Report_Print" })
	public String Emergency_Loan_Close_Report_Print(final Model model) {
		System.out.println("hello Emergency_Loan_Close_Report_Print");

		String emergency_loan_close_date = javabeans.getNew_loan_date();
		model.addAttribute("emergency_loan_close_date", emergency_loan_close_date);

		List<Emergency_Loan_Close> emergency_loan_close_details = javabeans.getEmergency_loan_close_details();
		model.addAttribute("emergency_loan_close_details", emergency_loan_close_details);

		return "Admin/Emergency_Loan_Close_Report_Print";
	}

	@RequestMapping({ "Admin/Loan_Close_Report_Print" })
	public String Loan_Close_Report_Print(final Model model) {
		System.out.println("hello Loan_Close_Report_Print");

		String new_loan_close_date = javabeans.getNew_loan_date();
		model.addAttribute("new_loan_close_date", new_loan_close_date);

		List<Loan_Closed> new_loan_close_details = javabeans.getNew_loan_close_details();
		model.addAttribute("new_loan_close_details", new_loan_close_details);

		return "Admin/Loan_Close_Report_Print";
	}

	@RequestMapping({ "Admin/Emergency_Loan" })
	public String Emergency_Loan(final Model model) {
		System.out.println("hello Admin");

		List<Add_Member> glist = AdminServ.GetAllGuarantorMemberInformation();
		model.addAttribute("glist", glist);

		List<Change_Interest> ci = AdminServ.GetAllChangeInterestInformation();
		model.addAttribute("ChangeInterestInfo", ci);

		// List<EmergencyLoan> el = AdminServ.GetAllEmergencyLoanInformation();
		// model.addAttribute("EmergencyLoanCloseInfo", el);

		List<EmeregencyLoanTrans> el = TransServ.GetAllEmergencyLoanTransInformation();
		model.addAttribute("EmergencyLoanInfo", el);

		return "Admin/Emergency_Loan";
	}

	@RequestMapping({ "Admin/FD_Report" })
	public String FD_Report() {
		System.out.println("hello Admin");
		return "Admin/FD_Report";
	}

	@RequestMapping({ "Admin/FD_Report_Print" })
	public String FD_Report_Print(final Model model) {
		System.out.println("hello FD_Report_Print");

		String fd_date = javabeans.getFd_date();
		model.addAttribute("fd_date", fd_date);

		List<FixedDeposite> fd_details = javabeans.getFd_details();
		model.addAttribute("fd_details", fd_details);

		return "Admin/FD_Report_Print";
	}

	@RequestMapping({ "Admin/Cancel_Member_Report" })
	public String Cancel_Member_Report() {
		System.out.println("hello Admin");
		return "Admin/Cancel_Member_Report";
	}

	@RequestMapping({ "Admin/Cancel_Member_Report_Print" })
	public String Cancel_Member_Report_Print(final Model model) {

		String cm_date = javabeans.getCancel_member_date();
		model.addAttribute("cl_date", cm_date);

		List<Cancel_Member> cancel_member_list = javabeans.getCancel_member_details();
		model.addAttribute("cancel_member_list", cancel_member_list);

		return "Admin/Cancel_Member_Report_Print";
	}

	@RequestMapping({ "Admin/Dead_Member_Report" })
	public String Dead_Member_Report() {
		System.out.println("hello Admin");
		return "Admin/Dead_Member_Report";
	}

	@RequestMapping({ "Admin/Dead_Member_Report_Print" })
	public String Dead_Member_Report_Print(final Model model) {

		String dm_date = javabeans.getDead_member_date();
		model.addAttribute("dm_date", dm_date);

		List<Dead_Member> dead_member_List = javabeans.getDead_member_details();
		model.addAttribute("dead_member_List", dead_member_List);

		return "Admin/Dead_Member_Report_Print";
	}

	@RequestMapping({ "Admin/Insurance_Report" })
	public String Insurance_Report() {
		System.out.println("hello Admin");
		return "Admin/Insurance_Report";
	}

	@RequestMapping({ "Admin/Insurance_Report_Print" })
	public String Insurance_Report_Print(final Model model) {
		System.out.println("hello Admin");

		String insurance_date = javabeans.getInsurance_date();
		model.addAttribute("insurance_date", insurance_date);

		List<TransInsurance> insurance_details = javabeans.getInsurance_details();
		model.addAttribute("insurance_details", insurance_details);

		return "Admin/Insurance_Report_Print";
	}

	@RequestMapping({ "Admin/Monthly_Deposit" })
	public String Monthly_Deposit(final Model model) {
		System.out.println("hello Monthly_Deposit");

		List<Trans_MonthlyDeposit> AllUserMonthlyDepositData = TransServ.GetAllUserMonthlyDeposit();
		model.addAttribute("AllUserMonthlyDepositData", AllUserMonthlyDepositData);

		return "Admin/Monthly_Deposit";
	}

	@RequestMapping({ "Admin/Monthly_Deposite_Report" })
	public String Monthly_Deposite_Report() {
		System.out.println("hello Monthly_Deposite_Report");
		return "Admin/Monthly_Deposite_Report";
	}

	@RequestMapping({ "Admin/Monthly_Deposite_Report_Print" })
	public String Monthly_Deposite_Report(final Model model) {
		System.out.println("hello Admin");

		String monthly_deposit_date = javabeans.getMonthly_deposit_date();
		model.addAttribute("monthly_deposit_date", monthly_deposit_date);

		List<Trans_MonthlyDeposit> monthly_deposit_details = javabeans.getMonthly_deposit_details();
		model.addAttribute("monthly_deposit_details", monthly_deposit_details);

		return "Admin/Monthly_Deposite_Report_Print";
	}

	@RequestMapping({ "Admin/Loan_Report" })
	public String Loan_Report() {
		System.out.println("hello Admin");
		return "Admin/Loan_Report";
	}

	@RequestMapping({ "Admin/Loan_Report_Print" })
	public String Loan_Report_Print(final Model model) {
		System.out.println("hello Loan_Report_Print");

		String new_loan_date = javabeans.getNew_loan_date();
		model.addAttribute("new_loan_date", new_loan_date);

		List<Loan_Trans> new_loan_details = javabeans.getNew_loan_details();
		model.addAttribute("new_loan_details", new_loan_details);

		return "Admin/Loan_Report_Print";
	}

	@RequestMapping({ "Admin/LoanAmountC" })
	public String LoanAmountC(final Model model) {
		System.out.println("hello Admin");
		List<Loan_Amount_Credit> lac = AdminServ.GetAllCreditLoanInformation();
		model.addAttribute("Credit_Loan_Info", lac);
		return "Admin/LoanAmountC";
	}

	@RequestMapping({ "Admin/Monthly_Deposit_Report" })
	public String Monthly_Deposit_Report() {
		System.out.println("hello Admin");
		return "Admin/Monthly_Deposit_Report";
	}

	@RequestMapping({ "Admin/navbar" })
	public String navbar(final Model model) {
		System.out.println("hello Admin");

		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDateTime now = LocalDateTime.now();
		System.out.println(dtf.format(now));
		String cdate1 = dtf.format(now);
		String cdate[] = cdate1.split("-");
		String bdate = cdate[1] + "-" + cdate[2];
		System.out.println(bdate);

		List<Add_Member> am = AdminServ.GetAllMemberBirthdayInformation(bdate);
		model.addAttribute("AddMemberInfo", am);

		return "Admin/navbar";
	}

	@RequestMapping({ "Admin/New_Loan" })
	public String New_Loan(final Model model) {
		System.out.println("hello Admin");

		List<Change_Interest> ci = AdminServ.GetAllChangeInterestInformation();

		model.addAttribute("ChangeInterestInfo", ci);

		// List<Loan> ln = AdminServ.GetAllLoanInformation();
		// model.addAttribute("LoanInfo", ln);

		List<Add_Member> glist = AdminServ.GetAllGuarantorMemberInformation();
		model.addAttribute("glist", glist);

		List<Loan_Trans> ln = AdminServ.GetAllLoanTransInformation();
		model.addAttribute("LoanInfo", ln);

		return "Admin/New_Loan";
	}

	@RequestMapping({ "Admin/New_Share" })
	public String New_Share(final Model model) {
		List<Trans_Share> AllUserShareData = TransServ.GetAllUserShare();
		model.addAttribute("ShareData", AllUserShareData);
		return "Admin/New_Share";
	}

	@RequestMapping({ "Admin/Other_Report" })
	public String Other_Report() {
		System.out.println("hello Admin");
		return "Admin/Other_Report";
	}

	@RequestMapping({ "Admin/Pat_Profile" })
	public String Pat_Profile() {
		System.out.println("hello Admin");
		return "Admin/Pat_Profile";
	}

	@RequestMapping({ "Admin/RD_Report" })
	public String RD_Report() {
		System.out.println("hello RD_Report");
		return "Admin/RD_Report";
	}

	@RequestMapping({ "Admin/RD_Report_Print" })
	public String RD_Report_Print(final Model model) {
		System.out.println("hello RD_Report_Print");

		String rd_date = javabeans.getRd_date();
		model.addAttribute("rd_date", rd_date);

		List<RecurringDeposit> rd_details = javabeans.getRd_details();
		model.addAttribute("rd_details", rd_details);

		return "Admin/RD_Report_Print";
	}

	@RequestMapping({ "Admin/Share_Report" })
	public String Share_Report() {
		System.out.println("hello Share_Report");

		return "Admin/Share_Report";
	}

	@RequestMapping({ "Admin/Share_Report_Print" })
	public String Share_Report_Print(final Model model) {
		System.out.println("hello Share_Report_Print");

		String share_date = javabeans.getShare_date();
		model.addAttribute("share_date", share_date);

		List<Trans_Share> share_details = javabeans.getShare_details();
		model.addAttribute("share_details", share_details);

		return "Admin/Share_Report_Print";
	}

	@RequestMapping({ "Admin/monthly_emi_change" })
	public String monthly_emi_change() {
		System.out.println("hello monthly_emi_change");
		return "Admin/monthly_emi_change";
	}

	@RequestMapping({ "Admin/Monthly_Deduction_Edit" })
	public String Monthly_Deduction_Edit() {
		System.out.println("hello Monthly_Deduction_Edit");
		return "Admin/Monthly_Deduction_Edit";
	}

	@RequestMapping({ "Admin/deduction" })
	public String deduction() {
		System.out.println("hello deduction");
		return "Admin/deduction";
	}

	@RequestMapping({ "Admin/Close_RD_data" })
	public String Close_RD_data(final Model model) {

		List<Close_RD> close_rd_list = AdminServ.GetAllCloseRd();
		model.addAttribute("close_rd_list", close_rd_list);
		return "Admin/Close_RD_data";
	}

	@RequestMapping({ "Admin/deduction_print" })
	public String deduction_print(final Model model) {
		System.out.println("hello deduction_print");
		// String month = "03-2022";
		String cmonth = javabeans.getCmonth();
		model.addAttribute("cmonth", cmonth);

		List<Deduction> deduction_details = AdminServ.GetAllDeductionDetails(cmonth);
		model.addAttribute("deduction_details", deduction_details);

		return "Admin/deduction_print";
	}

	@RequestMapping({ "Admin/deduction_compare_print" })
	public String deduction_compare_print(final Model model) {
		System.out.println("hello deduction_compare_print");

		List<Deduction_Compare> deduction_compare = javabeans.getDeduction_compare();
		model.addAttribute("deduction_compare", deduction_compare);

		return "Admin/deduction_compare_print";
	}

	@RequestMapping({ "Admin/New_Loan_EMI_Print" })
	public String New_Loan_EMI_Print(final Model model) {
		System.out.println("hello New_Loan_EMI_Print");
		// Vector<String> EMIList = javabeans.getEMIList();
		String EMIList = javabeans.getEMIList();
		String details = javabeans.getDetails();
		// System.out.println("List: "+EMIList);
		// System.out.println("Details : "+details);
		model.addAttribute("EMIList", EMIList);
		model.addAttribute("details", details);
		return "Admin/New_Loan_EMI_Print";
	}

	@RequestMapping({ "Admin/Adminloginvalidate" })
	@ResponseBody
	public String Adminloginvalidate(@RequestParam final String name, @RequestParam final String password,
			HttpSession session) {
		System.out.println("validation");
		String string = "fail";
		if (name.equals("Admin") && password.equals("Admin@123"))
			string = "Success";

		return string;
	}

	@RequestMapping(value = { "Admin/save_patsanstha_profile" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String save_patsanstha_profile(HttpServletRequest request) {
		String string = "Fail";
		System.out.println("hello save_patsanstha_profile");

		try {

			Pat_Profile pp = new Pat_Profile();

			pp.setPatname(request.getParameter("patname"));
			pp.setRegistrationnumber(request.getParameter("rno"));
			pp.setAddress(request.getParameter("address"));
			pp.setCity(request.getParameter("city"));
			pp.setState(request.getParameter("state"));
			pp.setPincode(request.getParameter("pincode"));
			pp.setYearofestablishment(request.getParameter("yoe"));
			pp.setContact(request.getParameter("mobile"));
			pp.setEmail(request.getParameter("email"));
			pp.setGst(request.getParameter("gst"));
			pp.setPan(request.getParameter("pannumber"));
			pp.setWebsite(request.getParameter("website"));
			// pp.setImage1(files.getBytes());

			// System.out.println(files.getBytes());

			string = AdminServ.save_patsanstha_profile(pp);

		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		// String string123 =
		// ServletUriComponentsBuilder.fromCurrentContextPath().path("/PhotoProfile/").path(files.getOriginalFilename()).toUriString();
		// System.out.println("localhost : "+string123);
		return string;
	}

	@RequestMapping(value = { "Admin/save_member" }, method = { RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	// public String save_member(HttpServletRequest request,@RequestParam("files")
	// MultipartFile files)
	public String save_member(HttpServletRequest request) {
		String string = "Fail";
		System.out.println("hello save_member");

		try {
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
			am.setGcount(0);
			string = AdminServ.save_member(am);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////						
			/*
			 * RecurringDepositeNew RDN = new RecurringDepositeNew();
			 * RDN.setAccno(request.getParameter("accountnumber"));
			 * RDN.setName(request.getParameter("fullname"));
			 * RDN.setRdamt(request.getParameter("rd"));
			 * RDN.setStartdate(request.getParameter("doj")); RDN.setTotamt("0");
			 * RDN.setTotal_rd_amt(request.getParameter("rd")); RDN.setStatus("start");
			 * string = AdminServ.save_new_rd(RDN);
			 */
			Share share = new Share();
			share.setAccountnumber(request.getParameter("accountnumber"));
			share.setFullname(request.getParameter("fullname"));
			share.setShareallot(request.getParameter("shares"));
			share.setDate(request.getParameter("doj"));
			share.setTotalamountofsahre("0");
			string = AdminServ.SaveShare(share);

			Insurance ins = new Insurance();
			ins.setAccountnumber(request.getParameter("accountnumber"));
			ins.setFullname(request.getParameter("fullname"));
			ins.setInsdebt(request.getParameter("insurance"));
			ins.setDate(request.getParameter("doj"));
			ins.setTotalinsuranceamount("0");
			string = AdminServ.SaveInsuranceOfUser(ins);

			MonthlyDeposit m_deposit_data = new MonthlyDeposit();
			m_deposit_data.setAccountnumber(request.getParameter("accountnumber"));
			m_deposit_data.setFullname(request.getParameter("fullname"));
			m_deposit_data.setM_debit(request.getParameter("monthlydeposit"));
			m_deposit_data.setCdate(request.getParameter("doj"));
			m_deposit_data.setM_deposit("0");
			string = AdminServ.SaveMonthlyDeposit(m_deposit_data);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////				
		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		// String string123 =
		// ServletUriComponentsBuilder.fromCurrentContextPath().path("/PhotoProfile/").path(files.getOriginalFilename()).toUriString();
		// System.out.println("localhost : "+string123);
		return string;
	}

	@RequestMapping(value = { "Admin/new_loan_save" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String new_loan_save(HttpServletRequest request,
			@RequestParam(value = "files", required = false) MultipartFile files) {
		String string = "Fail";
		String string1 = "Fail";
		System.out.println("hello");

		try {

			Loan lo = new Loan();

			lo.setAccountnumber(request.getParameter("accountnumber"));
			lo.setFullname(request.getParameter("fullname"));
			lo.setGrosssalary(request.getParameter("grosssalary"));
			lo.setNetsalary(request.getParameter("netsalary"));
			lo.setLoanamount(request.getParameter("loanbalance"));
			lo.setRoi(request.getParameter("roi"));
			lo.setTenure(request.getParameter("tenure"));
			lo.setEmi(request.getParameter("emi"));
			lo.setPrincipalamount(request.getParameter("principalamount"));
			lo.setIntrestamount(request.getParameter("intrestamount"));
			lo.setInsurance(request.getParameter("insurance"));
			lo.setShare(request.getParameter("share"));
			lo.setGuranteer(request.getParameter("guranteer"));
			lo.setGuranteer2(request.getParameter("guranteer2"));
			// lo.setTypeofloan(request.getParameter("typeofloan"));
			lo.setChequenumber(request.getParameter("chequenumber"));
			lo.setLoanbalance(request.getParameter("loanbalance"));
			lo.setDate(request.getParameter("date"));
			lo.setOdate(request.getParameter("date"));
			lo.setStatus("Pending");
			try {
				lo.setDocument(files.getBytes());
			} catch (Exception e) {
				System.out.println(e);
			}

			// System.out.println(files.getOriginalFilename());

			string = AdminServ.save_new_loan(lo);

			Loan_Trans lt = new Loan_Trans();

			// lt.setId(Integer.parseInt(request.getParameter("id")));
			lt.setAccountnumber(request.getParameter("accountnumber"));
			lt.setFullname(request.getParameter("fullname"));
			lt.setGrosssalary(request.getParameter("grosssalary"));
			lt.setNetsalary(request.getParameter("netsalary"));
			lt.setLoanamount(request.getParameter("loanamount"));
			lt.setRoi(request.getParameter("roi"));
			lt.setTenure(request.getParameter("tenure"));
			lt.setEmi(request.getParameter("emi"));
			lt.setPrincipalamount(request.getParameter("principalamount"));
			lt.setIntrestamount(request.getParameter("intrestamount"));
			lt.setInsurance(request.getParameter("insurance"));
			lt.setShare(request.getParameter("share"));
			lt.setGuranteer(request.getParameter("guranteer"));
			lt.setGuranteer2(request.getParameter("guranteer2"));
			// lt.setTypeofloan(request.getParameter("typeofloan"));
			lt.setChequenumber(request.getParameter("chequenumber"));
			lt.setLoanbalance(request.getParameter("loanbalance"));
			lt.setDate(request.getParameter("date"));
			try {
				lt.setDocument(files.getBytes());
			} catch (Exception e) {
				System.out.println(e);
			}
			// System.out.println(files.getOriginalFilename());
			string1 = AdminServ.save_trans_loan(lt);

			// String string1 =
			// AdminServ.UpdateInsuranceDetails(request.getParameter("accountnumber"),
			// request.getParameter("insurance"));

			// String string2 =
			// AdminServ.UpdateShareDetails(request.getParameter("accountnumber"),
			// request.getParameter("share"));

			String string3 = AdminServ.UpdateMemberGuantorCount(request.getParameter("guranteer"),
					request.getParameter("guranteer2"));
		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		// String string123 =
		// ServletUriComponentsBuilder.fromCurrentContextPath().path("/PhotoProfile/").path(files.getOriginalFilename()).toUriString();
		// System.out.println("localhost : "+string123);
		return string;
	}

	@RequestMapping(value = { "Admin/loan_amount_credit_save" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String loan_amount_credit_save(HttpServletRequest request,
			@RequestParam(value = "files", required = false) MultipartFile files) {
		String string = "Fail";
		String string1 = "Fail";

		try {

			// System.out.println(files.getOriginalFilename());

			Loan_Amount_Credit lac = new Loan_Amount_Credit();

			lac.setAccountnumber(request.getParameter("accountnumber"));
			lac.setFullname(request.getParameter("fullname"));
			lac.setLoanamount(request.getParameter("loanamount"));
			lac.setChequenumber(request.getParameter("chequenumber"));
			lac.setReceipt(request.getParameter("receipt"));
			lac.setShares(request.getParameter("shares"));
			lac.setInsurance(request.getParameter("insurance"));
			lac.setDate(request.getParameter("date"));

			String la = request.getParameter("loanamount");
			String pl = request.getParameter("prevloan");

			double la1 = Double.valueOf(la);
			double pl1 = Double.valueOf(pl);
			double pla = pl1 - la1;
			String prev_loan = String.valueOf(pla);

			// lac.setPrevloan(request.getParameter("prevloan"));
			lac.setPrevloan(prev_loan);
			try {
				lac.setDocument(files.getBytes());
			} catch (Exception e) {
				System.out.println(e);
			}

/////////////////////////////////////////////////////////////////////////////////////////////////////////		
			Loan_Trans lt = new Loan_Trans();

			// lt.setId(Integer.parseInt(request.getParameter("id")));
			lt.setAccountnumber(request.getParameter("accountnumber"));
			lt.setFullname(request.getParameter("fullname"));
			lt.setLoanamount(request.getParameter("loanamount"));
			lt.setRoi(request.getParameter("roi"));
			lt.setTenure(request.getParameter("tenure"));
			lt.setEmi(request.getParameter("emi"));
			lt.setPrincipalamount(request.getParameter("PrincipalAmount"));
			lt.setIntrestamount(request.getParameter("intrestamount"));
			lt.setInsurance(request.getParameter("insurance"));
			lt.setShare(request.getParameter("share"));
			lt.setGuranteer(request.getParameter("guranteer"));
			lt.setGuranteer2(request.getParameter("guranteer2"));
			lt.setChequenumber(request.getParameter("chequenumber"));
			lt.setLoanbalance(prev_loan);
			lt.setDate(request.getParameter("date"));
			// lt.setDocument(files.getBytes());
			// System.out.println(files.getOriginalFilename());
			string1 = AdminServ.save_trans_loan(lt);

			// System.out.println(files.getOriginalFilename());

			string = AdminServ.save_loan_amount_credit(lac);

			string1 = AdminServ.UpdateNewLoanDetails(request.getParameter("accountnumber"),
					request.getParameter("loanamount"));

			// String string2 =
			// AdminServ.UpdateInsuranceDetails(request.getParameter("accountnumber"),
			// request.getParameter("insurance"));

			// String string3 =
			// AdminServ.UpdateShareDetails(request.getParameter("accountnumber"),
			// request.getParameter("shares"));

		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/loan_closed" }, method = { RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String loan_closed(HttpServletRequest request,
			@RequestParam(value = "files", required = false) MultipartFile files) {
		String string = "Fail";
		String string1 = "Fail";

		try {

			Loan_Closed lc = new Loan_Closed();

			lc.setAccountnumber(request.getParameter("accountnumber"));
			lc.setFullname(request.getParameter("fullname"));
			lc.setDate(request.getParameter("date"));
			lc.setChequenumber(request.getParameter("chequenumber"));
			lc.setBalanceloan(request.getParameter("balanceloan"));
			lc.setIntrestamount(request.getParameter("intrestamount"));
			lc.setRemtenure(request.getParameter("remtenure"));
			lc.setChequenumber(request.getParameter("chequenumber"));
			lc.setRecieptnumber(request.getParameter("recieptnumber"));
			lc.setPaidamount(request.getParameter("paidamount"));
			try {
				lc.setDocument(files.getBytes());
			} catch (Exception e) {
				// TODO: handle exception
			}

			string = AdminServ.save_loan_closed(lc);
			string1 = AdminServ.UpdateRegularLoanDetails(request.getParameter("accountnumber"),
					request.getParameter("intrestamount"), request.getParameter("balanceloan"),
					request.getParameter("remtenure"));

			Loan_Trans lt = new Loan_Trans();

			lt.setAccountnumber(request.getParameter("accountnumber"));
			lt.setFullname(request.getParameter("fullname"));
			lt.setLoanamount(request.getParameter("balanceloan"));
			lt.setIntrestamount(request.getParameter("intrestamount"));
			lt.setChequenumber(request.getParameter("chequenumber"));
			lt.setReceiptnumber(request.getParameter("recieptnumber"));
			lt.setLoanbalance("0");
			lt.setDate(request.getParameter("date"));

			try {
				lt.setDocument(files.getBytes());
			} catch (Exception e) {
				System.out.println(e);
			}
			// System.out.println(files.getOriginalFilename());
			string1 = AdminServ.save_trans_loan(lt);

			String string3 = AdminServ.UpdateMemberGuantorCountLess(request.getParameter("guranteer1"),
					request.getParameter("guranteer2"));

		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/emergency_loan_save1" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String emergency_loan_save1(HttpServletRequest request,
			@RequestParam(value = "files", required = false) MultipartFile files) {
		String string = "Fail";
		String string1 = "Fail";

		try {

			// System.out.println(files.getOriginalFilename());

			EmergencyLoan el = new EmergencyLoan();

			el.setAccountnumber(request.getParameter("accountnumber"));
			el.setFullname(request.getParameter("fullname"));
			el.setRoi(request.getParameter("roi"));
			el.setTenure(request.getParameter("tenure"));
			el.setE_emi(request.getParameter("emi"));
			el.setE_principalamount(request.getParameter("principalamount"));
			el.setLoanamount(request.getParameter("eloanbalance"));
			el.setEloanbalance(request.getParameter("eloanbalance"));
			el.setE_intrestamount(request.getParameter("intrestamount"));
			el.setGuranteername1(request.getParameter("guranteername1"));
			el.setGuarnteername2(request.getParameter("guranteername2"));
			el.setChequenumber(request.getParameter("chequenumber"));
			el.setDate(request.getParameter("date"));
			el.setOdate(request.getParameter("date"));
			el.setStatus("Pending");
			// el.setTypeofloan(request.getParameter("typeofloan"));
			try {
				el.setDocument(files.getBytes());
			} catch (Exception e) {
				System.out.println(e);
			}

			// System.out.println(files.getOriginalFilename());
			string = AdminServ.save_emergency_loan(el);

			EmeregencyLoanTrans elt = new EmeregencyLoanTrans();

			elt.setAccountnumber(request.getParameter("accountnumber"));
			elt.setFullname(request.getParameter("fullname"));
			elt.setRoi(request.getParameter("roi"));
			elt.setTenure(request.getParameter("tenure"));
			elt.setE_emi(request.getParameter("emi"));
			elt.setE_principalamount(request.getParameter("principalamount"));
			elt.setLoanamount(request.getParameter("loanamount"));
			elt.setEloanbalance(request.getParameter("eloanbalance"));
			elt.setE_intrestamount(request.getParameter("intrestamount"));
			elt.setGuranteername1(request.getParameter("guranteername1"));
			elt.setGuranteername2(request.getParameter("guranteername2"));
			elt.setChequenumber(request.getParameter("chequenumber"));
			elt.setDate(request.getParameter("date"));
			// elt.setTypeofloan(request.getParameter("typeofloan"));
			try {
				elt.setDocument(files.getBytes());
			} catch (Exception e) {
				System.out.println(e);
			}

			string1 = TransServ.save_emergency_loan_trans(elt);
			String string3 = AdminServ.UpdateMemberGuantorCount(request.getParameter("guranteername1"),
					request.getParameter("guranteername2"));

		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/emergency_loan_credit_save" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String emergency_loan_credit_save(HttpServletRequest request) {
		String string = "Fail";
		String string1 = "Fail";
		try {

			Emergency_Loan_Credit elc = new Emergency_Loan_Credit();

			elc.setAccountnumber(request.getParameter("accountnumber"));
			elc.setFullname(request.getParameter("fullname"));
			elc.setDate1(request.getParameter("date1"));
			elc.setPreviousbalance(request.getParameter("previousbalance"));
			elc.setLoanamount(request.getParameter("loanamount"));
			elc.setChequenumber(request.getParameter("chequenumber"));
			elc.setReceiptnumber(request.getParameter("receiptnumber"));

			string = AdminServ.save_emergency_loan_credit(elc);

			double loanbalance = Double.parseDouble(request.getParameter("previousbalance"))
					- Double.parseDouble(request.getParameter("loanamount"));
			String eloanbalance = String.valueOf(loanbalance);
			/////////////////////////////////////////////////////////////////////////////////////////////////////////

			EmeregencyLoanTrans elt = new EmeregencyLoanTrans();

			elt.setAccountnumber(request.getParameter("accountnumber"));
			elt.setFullname(request.getParameter("fullname"));
			elt.setRoi(request.getParameter("roi"));
			elt.setTenure(request.getParameter("tenure"));
			elt.setE_emi(request.getParameter("emi"));
			elt.setE_principalamount(request.getParameter("loanamount"));
			// elt.setLoanamount(request.getParameter("loanamount"));
			elt.setEloanbalance(eloanbalance);
			elt.setE_intrestamount(request.getParameter("intrestamount"));
			elt.setChequenumber(request.getParameter("chequenumber"));
			elt.setDate(request.getParameter("date1"));

			string1 = TransServ.save_emergency_loan_trans(elt);

			string1 = AdminServ.UpdateEmergencyLoanDetails(request.getParameter("accountnumber"),
					request.getParameter("loanamount"));
		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/emergency_loan_close_save" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String emergency_loan_close_save(HttpServletRequest request) {
		String string = "Fail";
		String string1 = "Fail";
		String string2 = "Fail";

		try {

			Emergency_Loan_Close elcl = new Emergency_Loan_Close();

			elcl.setAccountnumber(request.getParameter("accountnumber"));
			elcl.setFullname(request.getParameter("fullname"));
			elcl.setDate1(request.getParameter("date1"));
			elcl.setBalanceloan(request.getParameter("balanceloan"));
			elcl.setInterestamount(request.getParameter("interestamount"));
			// elcl.setRemainingtenure(request.getParameter("remainingtenure"));
			elcl.setChequenumber(request.getParameter("chequenumber"));
			elcl.setReceiptnumber(request.getParameter("receiptnumber"));
			elcl.setPaidamount(request.getParameter("paidamount"));

			string = AdminServ.save_emergency_loan_close(elcl);

			string1 = AdminServ.UpdateEmergencyRegularLoanDetails(request.getParameter("accountnumber"),
					request.getParameter("balanceloan"));

			EmeregencyLoanTrans elt = new EmeregencyLoanTrans();

			elt.setAccountnumber(request.getParameter("accountnumber"));
			elt.setFullname(request.getParameter("fullname"));
			elt.setLoanamount(request.getParameter("paidamount"));
			elt.setEloanbalance("0");
			elt.setE_intrestamount(request.getParameter("interestamount"));
			elt.setChequenumber(request.getParameter("chequenumber"));
			elt.setReceiptnumber(request.getParameter("receiptnumber"));
			elt.setDate(request.getParameter("date1"));
			// elt.setTypeofloan(request.getParameter("typeofloan"));

			string2 = TransServ.save_emergency_loan_trans(elt);

			String string3 = AdminServ.UpdateMemberGuantorCountLess(request.getParameter("guranteer1"),
					request.getParameter("guranteer2"));
		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		return string;
	}

	/*
	 * @RequestMapping(value = {"Admin/monthly_emi_change_save"}, method =
	 * {RequestMethod.POST}, consumes = "multipart/form-data")
	 * 
	 * @ ResponseBody public String monthly_emi_change_save(HttpServletRequest
	 * request) { String string = "Fail";
	 * 
	 * try {
	 * 
	 * Monthly_Emi_Change mec = new Monthly_Emi_Change();
	 * 
	 * mec.setAccountnumber(request.getParameter("accountnumber"));
	 * mec.setFullname(request.getParameter("fullname"));
	 * mec.setShares(request.getParameter("shares"));
	 * mec.setMonthlydeposit(request.getParameter("monthlydeposit"));
	 * mec.setInsurance(request.getParameter("insurance"));
	 * mec.setRegularloan(request.getParameter("regularloan"));
	 * mec.setEmergencyloan(request.getParameter("emergencyloan"));
	 * mec.setRd(request.getParameter("rd"));
	 * mec.setDate1(request.getParameter("date1"));
	 * 
	 * string = AdminServ.save_monthly_emi_change(mec);
	 * 
	 * } catch (Exception e) { string ="Fail"; System.out.println(e); }
	 * 
	 * return string; }
	 */

	@RequestMapping(value = { "Admin/monthly_emi_update_save" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String monthly_emi_update_save(HttpServletRequest request) {
		String string = "Fail";
		String string1 = "Fail";

		try {

			Monthly_Emi_Change mec = new Monthly_Emi_Change();

			mec.setAccountnumber(request.getParameter("accountnumber"));
			mec.setFullname(request.getParameter("fullname"));
			mec.setShares(request.getParameter("shares"));
			mec.setMonthlydeposit(request.getParameter("monthlydeposit"));
			mec.setInsurance(request.getParameter("insurance"));
			mec.setRegularloan(request.getParameter("regularloan"));
			mec.setRegularloaninterest(request.getParameter("regularloaninterest"));
			mec.setEmergencyloan(request.getParameter("emergencyloan"));
			mec.setEmergencyloaninterest(request.getParameter("emergencyloaninterest"));
			// mec.setRd(request.getParameter("rd"));
			mec.setDate1(request.getParameter("date1"));

//			string = AdminServ.save_monthly_emi_change(mec);
			string = AdminServ.UpdateMonthlyEmiChangeDetails(request.getParameter("accountnumber"),
					request.getParameter("shares"), request.getParameter("monthlydeposit"),
					request.getParameter("insurance"), request.getParameter("regularloan"),
				    request.getParameter("emergencyloan"));
			System.out.println("Hello : "+request.getParameter("emergencyloan"));

		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/monthly_deduction_edit" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String monthly_deduction_edit(HttpServletRequest request) {
		String string = "Fail";
		String string1 = "Fail";

		try {

			string = AdminServ.UpdateMonthlyDeductionEditDetails(request.getParameter("accountnumber"),
					request.getParameter("shares"), request.getParameter("monthlydeposit"),
					request.getParameter("insurance"), request.getParameter("regularloan"),
					request.getParameter("regularloaninterest"), request.getParameter("emergencyloan"),
					request.getParameter("emergencyloaninterest"));

		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/fd_save" }, method = { RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String fd_save(HttpServletRequest request,
			@RequestParam(value = "files", required = false) MultipartFile files) {
		String string = "Fail";

		try {

			// System.out.println(files.getOriginalFilename());

			FixedDeposite fd = new FixedDeposite();

			fd.setAccountnumber(request.getParameter("accountnumber"));
			fd.setFdcertificatenumber(request.getParameter("fdcertificatenumber"));
			fd.setFullname(request.getParameter("fullname"));
			fd.setFdamount(request.getParameter("fdamount"));
			fd.setFddate(request.getParameter("fddate"));
			fd.setMaturingdate(request.getParameter("maturingdate"));
			fd.setRoi(request.getParameter("roi"));
			fd.setTotalamount(request.getParameter("totalamount"));
			fd.setStatus("start");
			try {
				fd.setDocument(files.getBytes());
			} catch (Exception e) {
				System.out.println(e);
			}

			// System.out.println(files.getOriginalFilename());

			string = AdminServ.save_fd(fd);

		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping({ "Admin/CloseFDMember" })
	@ResponseBody
	public String CloseFDMember(@RequestParam final String AccountNumber) {
		// System.out.println("hello Admin");
		List<FixedDeposite> FD = FDR.findfdByAccountNumber(AccountNumber);
		// System.out.println("RD Size: "+RD.size());
		// for (int i = 0; i < FD.size(); i++) {
		// FixedDeposite FDep = FD.get(i);
		// System.out.println("Controller FD Date : "+FDep.getFddate());
		// double FDAmountWithInterest =
		// AdminServ.CalFDAmountTillDate(FDep.getFdamount(), FDep.getFddate());
		// FDep.setFDAmountTillDate(FDAmountWithInterest);
		// }
		javabeans.setFixed_depo(FD);
		return "Success";
	}

	@RequestMapping({ "Admin/CloseRDMember" })
	@ResponseBody
	public String CloseRDMember(@RequestParam final String AccountNumber) {

		// System.out.println("hello Admin");

		// List<RecurringDeposit> RD = RDR.findrdByAccountNumber(AccountNumber);
		// System.out.println("RD Size: "+RD.size());
		// for (int i = 0; i < RD.size(); i++) {
		// RecurringDeposit RDep = RD.get(i);
		// double RDAmountWithInterest =
		// AdminServ.CalRDAmountTillDate(String.valueOf(RDep.getRdamount()),
		// RDep.getRddate());
		// RDep.setRDAmountTillDate(RDAmountWithInterest);
		// System.out.println("calculated RD: "+RD.get(i).getRDAmountTillDate());
		// }
		// List<RecurringDeposit> RD =
		// AdminServ.SearchAllCloseRDOfMember(AccountNumber);
		List<RecurringDepositeNew> RD = AdminServ.SearchAllCloseNewRDOfMember(AccountNumber);
		javabeans.setNew_recurring_deposit_details(RD);
		return "Success";
	}

	@RequestMapping(value = { "Admin/close_fd_save" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String close_fd_save(HttpServletRequest request) {
		String string = "Fail";
		String string1 = "Fail";

		try {

			// Close_FD cf = new Close_FD();
			FixedDeposite cf = new FixedDeposite();

			cf.setId(Integer.parseInt(request.getParameter("id")));
			cf.setAccountnumber(request.getParameter("accountnumber"));
			cf.setFdcertificatenumber(request.getParameter("fdcertificatenumber"));
			cf.setFullname(request.getParameter("fullname"));
			cf.setFddate(request.getParameter("fdstartdate"));
			cf.setMaturingdate(request.getParameter("fdmaturedate"));
			cf.setFdamount(request.getParameter("fdamount"));
			// cf.setFdclosedate(request.getParameter("fdclosedate"));
			// cf.setInterestamount(request.getParameter("interestamount"));
			cf.setRoi(request.getParameter("roi"));
			cf.setTotalamount(request.getParameter("totalamount"));
			cf.setChequenumber(request.getParameter("chequenumber"));
			cf.setReceiptnumber(request.getParameter("receiptnumber"));
			cf.setStatus("close");

			double cc = Double.parseDouble(request.getParameter("totalamount"))
					- Double.parseDouble(request.getParameter("fdamount"));
			cf.setFdinterest(String.valueOf(cc));

			string = AdminServ.save_close_fd(cf);
			// string1 =
			// AdminServ.UpdateFDStatus(Integer.parseInt(request.getParameter("id")),request.getParameter("chequenumber"),request.getParameter("receiptnumber"));

			//////////////////////////// Close FD Refresh /////////////////////////////
			List<FixedDeposite> FD = FDR.findfdByAccountNumber(request.getParameter("accountnumber"));
			// for (int i = 0; i < FD.size(); i++) {
			// FixedDeposite FDep = FD.get(i);
			// double FDAmountWithInterest =
			// AdminServ.CalFDAmountTillDate(FDep.getFdamount(), FDep.getFddate());
			// FDep.setFDAmountTillDate(FDAmountWithInterest);
			// }
			javabeans.setFixed_depo(FD);
			///////////////////////////// Close FD Refresh ////////////////////////////

		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/close_rd_save" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String close_rd_save(HttpServletRequest request) {
		String string = "Fail";
		String string1 = "Fail";

		try {

			// RecurringDepositeNew cr = new RecurringDepositeNew();

			String status = "close";
			/*
			 * cr.setId(Integer.parseInt(request.getParameter("id")));
			 * cr.setAccno(request.getParameter("accountnumber"));
			 * cr.setName(request.getParameter("fullname"));
			 * cr.setRdamt(request.getParameter("rdamount"));
			 * cr.setStartdate(request.getParameter("startdate"));
			 * cr.setEnddate(request.getParameter("enddate"));
			 * cr.setRoi(request.getParameter("roi"));
			 * cr.setTotamt(request.getParameter("totamt"));
			 * cr.setCheque_no(request.getParameter("chequenumber"));
			 * cr.setReceiptnumber(request.getParameter("receiptnumber"));
			 * cr.setStatus(status);
			 * 
			 * string = AdminServ.save_close_rd(cr);
			 */

			Close_RD cr = new Close_RD();

			cr.setAccountnumber(request.getParameter("accountnumber"));
			cr.setFullname(request.getParameter("fullname"));
			cr.setRdamount(request.getParameter("rdamount"));
			cr.setStartdate(request.getParameter("startdate"));
			cr.setEnddate(request.getParameter("enddate"));
			cr.setTotamt(request.getParameter("totamt"));
			cr.setRoi(request.getParameter("roi"));
			cr.setChequenumber(request.getParameter("chequenumber"));
			cr.setReceiptnumber(request.getParameter("receiptnumber"));
			cr.setStatus(status);

			string1 = AdminServ.save_close_rd(cr);

			// string = AdminServ.UpdateRDStatus(request.getParameter("id"),
			// request.getParameter("rdamount"), request.getParameter("enddate"),
			// request.getParameter("totamt"), request.getParameter("chequenumber"),
			// request.getParameter("receiptnumber"));
			// System.out.println(string+" "+string1);

			string = AdminServ.DeleteNewRD(Integer.parseInt(request.getParameter("id")));

			List<RecurringDepositeNew> RD = AdminServ
					.SearchAllCloseNewRDOfMember(request.getParameter("accountnumber"));
			javabeans.setNew_recurring_deposit_details(RD);
			//////////////////////////////////// Close RD Refresh
			//////////////////////////////////// ///////////////////////////////////////////////////
			// List<RecurringDeposit> RD =
			// RDR.findrdByAccountNumber(request.getParameter("accountnumber"));
			// for (int i = 0; i < RD.size(); i++) {
			// RecurringDeposit RDep = RD.get(i);
			// double RDAmountWithInterest =
			// AdminServ.CalRDAmountTillDate(String.valueOf(RDep.getRdamount()),
			// RDep.getRddate());
			// RDep.setRDAmountTillDate(RDAmountWithInterest);
			// }
			// javabeans.setRecurring_depo(RD);
			///////////////////////////////////// Close RD Refresh
			// //////////////////////////////////////////////////
		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/New_Loan_Update_Guarantor" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String New_Loan_Update_Guarantor(HttpServletRequest request) {
		String string = "Fail";

		try {

			string = AdminServ.UpdateLoanGuarantor(request.getParameter("accountnumber"),
					request.getParameter("guranteer"), request.getParameter("guranteer2"),
					request.getParameter("chequenumber"));

		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/Emergency_Loan_Update_Guarantor" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String Emergency_Loan_Update_Guarantor(HttpServletRequest request) {
		String string = "Fail";

		try {

			string = AdminServ.UpdateEmergencyLoanGuarantor(request.getParameter("accountnumber"),
					request.getParameter("guranteer"), request.getParameter("guranteer2"),
					request.getParameter("chequenumber"));

		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping({ "Admin/SearchRdRecord" })
	@ResponseBody
	public String[] SearchRdRecord(@RequestParam final String accountnumber) {
		List<RecurringDeposit> ListRD = null;
		ListRD = AdminServ.SearchAllRDOfMember(accountnumber);
		String[] str = new String[ListRD.size()];
		for (int i = 0; i < ListRD.size(); i++) {
			double string = ListRD.get(i).getRdamount();
			String string1 = String.valueOf(string);
			str[i] = string1;
		}
		return str;
	}

	@RequestMapping({ "Admin/SearchRdData" })
	@ResponseBody
	public String SearchRdData(@RequestParam final String accountnumber) {
		System.out.println("inside search rd");

		return "";
	}

	@RequestMapping(value = { "Admin/dead_member_save" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String dead_member_save(HttpServletRequest request) {
		String string = "Fail";

		try {

			Dead_Member dm = new Dead_Member();

			dm.setAccountnumber(request.getParameter("accountnumber"));
			dm.setFullname(request.getParameter("fullname"));
			dm.setDateofdeath(request.getParameter("dateofdeath"));
			dm.setShares(request.getParameter("shares"));
			dm.setFd(request.getParameter("fd"));
			dm.setInsurance(request.getParameter("insurance"));
			dm.setPercentamount(request.getParameter("percentamount"));
			dm.setRd(request.getParameter("rd"));
			dm.setTotalregularloan(request.getParameter("totalregularloan"));
			dm.setIntrestregularloan(request.getParameter("intrestregularloan"));
			dm.setTotalemerloan(request.getParameter("totalemerloan"));
			dm.setIntrestonemerloan(request.getParameter("intrestonemerloan"));
			dm.setMonthlydeposit(request.getParameter("monthlydeposit"));
			dm.setTotalamount(request.getParameter("totalamount"));
			dm.setPayableamount(request.getParameter("payableamount"));
			dm.setCheque(request.getParameter("cheque"));
			dm.setChequedate(request.getParameter("chequedate"));
			dm.setPayto(request.getParameter("payto"));
			dm.setNom1(request.getParameter("nom1"));
			dm.setNom2(request.getParameter("nom2"));
			dm.setSalary_accountnumber(request.getParameter("salary_accountnumber"));

			string = AdminServ.save_dead_member(dm);

			String string1 = this.AdminServ.DeleteCancelMemberDetails(request.getParameter("accountnumber"));

		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/cancel_member_save" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String cancel_member_save(HttpServletRequest request) {
		String string = "Fail";

		try {

			Cancel_Member cm = new Cancel_Member();

			cm.setAccountnumber(request.getParameter("accountnumber"));
			cm.setFullname(request.getParameter("fullname"));
			cm.setDate(request.getParameter("date"));
			cm.setReason(request.getParameter("reason"));
			cm.setShares(request.getParameter("shares"));
			cm.setFd(request.getParameter("fd"));
			cm.setInsurance(request.getParameter("insurance"));
			cm.setPercentamount(request.getParameter("percentamount"));
			cm.setRd(request.getParameter("rd"));
			cm.setTotalregularloan(request.getParameter("totalregularloan"));
			cm.setIntrestregularloan(request.getParameter("intrestregularloan"));
			cm.setTotalemerloan(request.getParameter("totalemerloan"));
			cm.setIntrestonemerloan(request.getParameter("intrestonemerloan"));
			cm.setMonthlydeposit(request.getParameter("monthlydeposit"));
			cm.setTotalamount(request.getParameter("totalamount"));
			cm.setPayableamount(request.getParameter("payableamount"));
			cm.setCheque(request.getParameter("cheque"));
			cm.setChequedate(request.getParameter("chequedate"));
			cm.setPayaccountname(request.getParameter("payaccountname"));

			string = AdminServ.save_cancel_member(cm);

			String string1 = this.AdminServ.DeleteCancelMemberDetails(request.getParameter("accountnumber"));

		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/check_loan_sanction" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String check_loan_sanction(HttpServletRequest request) {
		String string = "Fail";

		try {

			string = AdminServ.CheckLoanSanction(request.getParameter("loanamount"), request.getParameter("netsalary"),
					request.getParameter("share"), request.getParameter("insurance"));
			// System.out.println("Loan Result : "+string);
			if (string.equals("")) {
				string = "Success";
			}
		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		return string;
	}

	/*
	 * @RequestMapping(value = {"Admin/LoanAutoCalculate"}, method =
	 * {RequestMethod.POST}, consumes = "multipart/form-data")
	 * 
	 * @ ResponseBody public String LoanAutoCalculate(HttpServletRequest request) {
	 * //String[] string= new String[2]; String string=""; try {
	 * 
	 * string= AdminServ.LoanAutoCalculate(request.getParameter("loanamount"),
	 * request.getParameter("roi"), request.getParameter("tenure"));
	 * System.out.println("Loan Result : "+string);
	 * 
	 * } catch (Exception e) { // string ="Fail"; System.out.println(e); }
	 * 
	 * return string; }
	 */

	@RequestMapping(value = { "Admin/CalculateRDTotalAmount" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public double CalculateRDTotalAmount(HttpServletRequest request) {

		double rdtilldate = 0.0;
		try {

			double rdamount = Double.parseDouble(request.getParameter("rdamt"));
			double interestrate = Double.parseDouble(request.getParameter("roi"));
			double month = Double.parseDouble(request.getParameter("tmonth"));
			rdtilldate = rdamount;
			for (int i = 1; i < month; i++) {
				rdtilldate += rdamount + (rdtilldate * interestrate / 1200);
			}
			System.out.println("rdtilldate:  " + rdtilldate);

		} catch (Exception e) {
			// string ="Fail";
			System.out.println(e);
		}

		return rdtilldate;
	}

	@RequestMapping(value = { "Admin/CalculateFDTotalAmount" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public double CalculateFDTotalAmount(HttpServletRequest request) {

		double fdtilldate = 0.0;
		try {

			double fdamount = Double.parseDouble(request.getParameter("fdamount"));
			double interestrate = Double.parseDouble(request.getParameter("roi"));
			double tdays = Double.parseDouble(request.getParameter("tdays"));
			// fdtilldate =fdamount;
			// for(int i = 1; i < tdays;i++)
			// {
			//
			// fdtilldate = (fdtilldate*interestrate/1200);
			// 80000*8/1200
			// }
			// fdtilldate = fdamount + (fdamount*interestrate)/1200;
			fdtilldate = fdamount + (fdamount * tdays) * interestrate / 36500;
			System.out.println("fdtilldate:  " + fdtilldate);

		} catch (Exception e) {
			// string ="Fail";
			System.out.println(e);
		}

		return fdtilldate;
	}

	@RequestMapping(value = { "Admin/LoanAutoCalculate" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String LoanAutoCalculate(HttpServletRequest request) {
		// String[] string= new String[2];
		String string = "";
		DecimalFormat df = new DecimalFormat("0.00");
		try {

			Vector<String> EMIList = AdminServ.LoanAutoCalculate(request.getParameter("loanamount"),
					request.getParameter("roi"), request.getParameter("tenure"));
			// System.out.println("Loan Result : "+string);

			string = EMIList.get(0);
			String str[] = string.split(":");
			double calMonthlyEMI = Double.parseDouble(str[1]) + Double.parseDouble(str[2]);
			string = str[1] + ":" + df.format(calMonthlyEMI) + ":" + str[2];

		} catch (Exception e) {
			// string ="Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/search_printAmortizationSchedule" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String search_printAmortizationSchedule(HttpServletRequest request) {
		String string = "Success";
		Vector<String> EMIList = AdminServ.LoanAutoCalculate(request.getParameter("loanamount"),
				request.getParameter("roi"), request.getParameter("tenure"));

		String accountnumber = request.getParameter("accountnumber");
		String fullname = request.getParameter("fullname");
		String ldate = request.getParameter("date");

		String text = EMIList.toString().replace("[", "").replace("]", "");

		javabeans.setDetails(accountnumber + ":" + fullname + ":" + ldate);
		javabeans.setEMIList(text);

		// System.out.println("VB Result : "+text);

		return string;

	}

	@RequestMapping(value = { "Admin/search_new_loan_details" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String search_new_loan_details(HttpServletRequest request) {
		// String[] string= new String[2];
		String string = "";
		String string1 = "";
		String string2 = "";
		String string3 = "";
		String string8 = "";
		try {
			Add_Member us = AdminServ.GetUserName(request.getParameter("accountnumber"));
			string8 = us.getFullname();
			// string1=
			// AdminServ.SearchInsuranceDetails(request.getParameter("accountnumber"));
			// string2= AdminServ.SearchShareDetails(request.getParameter("accountnumber"));
			string1 = AdminServ.SearchDeadInsuranceDetails(request.getParameter("accountnumber"));
			string2 = AdminServ.SearchDeadShareDetails(request.getParameter("accountnumber"));
			string3 = AdminServ.SearchRegularLoanBalanceDetails(request.getParameter("accountnumber"));
			String str[] = string3.split(":");
			if (str[0].equals("")) {
				string3 = "0:0";
			}
			string = string8 + ":" + string1 + ":" + string2 + ":" + str[0] + ":" + str[1];
			// System.out.println("Search Insurance Details : "+string1);
			// System.out.println("Search Share Details : "+string2);
			// System.out.println("Search Loan Balance Details : "+string3);

		} catch (Exception e) {
			// string ="Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/search_emergency_loan_details" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String search_emergency_loan_details(HttpServletRequest request) {
		// String[] string= new String[2];
		String string = "";
		String string1 = "";
		String string2 = "";
		try {

			// string1=
			// AdminServ.SearchInsuranceDetails(request.getParameter("accountnumber"));
			// string2= AdminServ.SearchShareDetails(request.getParameter("accountnumber"));
			string1 = AdminServ.SearchMemberDetails(request.getParameter("accountnumber"));
			string2 = AdminServ.SearchEmergencyBalanceLoanDetails(request.getParameter("accountnumber"));
			if (string2.equals("")) {
				string2 = "0:0";
			}
			string = string1 + ":" + string2;
			System.out.println("Search Member Details : " + string1);
			System.out.println("Search Emergency Loan Details : " + string2);

		} catch (Exception e) {
			// string ="Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/search_credit_loan_details" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String search_credit_loan_details(HttpServletRequest request) {
		// String[] string= new String[2];
		String string = "";
		String string1 = "";
		String string2 = "";
		String string3 = "";
		String string4 = "";
		try {
			Add_Member us = AdminServ.GetUserName(request.getParameter("accountnumber"));
			string4 = us.getFullname();
			string1 = AdminServ.SearchDeadShareDetails(request.getParameter("accountnumber"));
			string2 = AdminServ.SearchDeadInsuranceDetails(request.getParameter("accountnumber"));
			String[] stringarr = AdminServ.SearchCreditLoanDetails(request.getParameter("accountnumber"));

			string = string4 + ":" + string1 + ":" + string2 + ":" + stringarr[0] + ":" + stringarr[1];
			// System.out.println("Search New Loan Details : "+string);

		} catch (Exception e) {
			// string ="Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/search_emergency_credit_loan_details" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String search_emergency_credit_loan_details(HttpServletRequest request) {
		// String[] string= new String[2];
		String string = "";
		try {

			string = AdminServ.SearchEmergencyCreditLoanDetails(request.getParameter("accountnumber"));
			// System.out.println("Search Emergency Loan Details : "+string);

		} catch (Exception e) {
			// string ="Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/search_close_loan_details" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String search_close_loan_details(HttpServletRequest request) {
		// String[] string= new String[2];
		String string = "";
		String string1 = "";
		try {

			string = AdminServ.SearchCloseLoanDetails(request.getParameter("accountnumber"));
			// System.out.println("Search Close Loan Details : "+string);

		} catch (Exception e) {
			// string ="Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/search_emergency_close_loan_details" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String search_emergency_close_loan_details(HttpServletRequest request) {
		// String[] string= new String[2];
		String string = "";
		try {

			string = AdminServ.SearchEmergencyCloseLoanDetails(request.getParameter("accountnumber"));
			// System.out.println("Search Emergency Close Loan Details : "+string);

		} catch (Exception e) {
			// string ="Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/search_monthly_emi_change" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String search_monthly_emi_change(HttpServletRequest request) {
		// String[] string= new String[2];
		String string = "";
		String string1 = "";
		String string2 = "";
		String string3 = "";
		String string4 = "";
		String string5 = "";
		// String string6 = "";
		try {
			string1 = AdminServ.SearchShareDetails(request.getParameter("accountnumber")); // fullname+":"+share
			string2 = AdminServ.SearchMonthDepositDetails(request.getParameter("accountnumber")); // mdeposit
			string3 = AdminServ.SearchInsuranceDetails(request.getParameter("accountnumber")); // insurance
			string4 = AdminServ.SearchRegularLoanDetails(request.getParameter("accountnumber")); // principalamount+":"+interestamount
			string5 = AdminServ.SearchEmergencyLoanDetails(request.getParameter("accountnumber")); // e_principalamount+":"+e_intrestamount
			// string6= AdminServ.SearchRDDetails(request.getParameter("accountnumber"));
			string = string1 + ":" + string2 + ":" + string3 + ":" + string4 + ":" + string5;
			System.out.println(string);
			// System.out.println("Search Insuyrance Details : "+string1);
			// System.out.println("Search Share Details :
			// "+string1+":"+string2+":"+string3+":"+string4+":"+string5+":"+string6);

		} catch (Exception e) {
			// string ="Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/change_interest_save" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String change_interest_save(HttpServletRequest request) {
		String string = "Fail";

		try {

			Change_Interest ci = new Change_Interest();

			ci.setInteresttype(request.getParameter("interesttype"));
			ci.setRoi(request.getParameter("roi"));

			string = AdminServ.save_change_interest(ci);

		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping("Admin/delete_change_interest")
	@ResponseBody
	private String delete_change_interest(@RequestParam final int id) {
		String string = this.AdminServ.DeleteChangeInterest(id);

		return "Success";
	}

	@RequestMapping(value = { "Admin/dividend_interest_save" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String dividend_interest_save(HttpServletRequest request) {
		String string = "Fail";

		try {

			Dividend_Interest di = new Dividend_Interest();

			di.setShare_interest(request.getParameter("share_interest"));
			di.setMonthly_deposit_interest(request.getParameter("monthly_deposit_interest"));

			string = AdminServ.save_dividend_interest(di);

		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping("Admin/delete_dividend_interest")
	@ResponseBody
	private String delete_dividend_interest(@RequestParam final int id) {
		String string = this.AdminServ.DeleteDividendInterest(id);

		return "Success";
	}

	@RequestMapping(value = { "Admin/type_of_loan" }, method = { RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String type_of_loan(HttpServletRequest request) {
		// String[] string= new String[2];
		String string = "";

		try {

			string = AdminServ.SearchType_of_loan(request.getParameter("interesttype"));
			// System.out.println("Search ROI : "+string);

		} catch (Exception e) {
			// string ="Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/search_dead_members" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String search_dead_members(HttpServletRequest request) {
		String string = "";
		String string1 = "";
		String string2 = "";
		String string3 = "";
		String string4 = "";
		String string5 = "";
		String string6 = "";
		String string7 = "";
		String string8 = "";
		try {
			Add_Member us = AdminServ.GetUserName(request.getParameter("accountnumber"));
			string8 = us.getFullname();

			string1 = AdminServ.SearchDeadShareDetails(request.getParameter("accountnumber"));
			string2 = AdminServ.SearchDeadRDDetails(request.getParameter("accountnumber"));
			string3 = AdminServ.SearchDeadFDDetails(request.getParameter("accountnumber"));
			string4 = AdminServ.SearchDeadInsuranceDetails(request.getParameter("accountnumber"));
			string5 = AdminServ.SearchDeadMonthDepositDetails(request.getParameter("accountnumber"));
			string6 = AdminServ.SearchDeadRegularLoanDetails(request.getParameter("accountnumber"));
			string7 = AdminServ.SearchDeadEmergencyLoanDetails(request.getParameter("accountnumber"));

			string = string8 + ":" + string1 + ":" + string2 + ":" + string3 + ":" + string4 + ":" + string5 + ":"
					+ string6 + ":" + string7;
			// System.out.println("Search Dead Details :
			// "+string1+":"+string2+":"+string3+":"+string4+":"+string5+":"+string6+":"+string7);

		} catch (Exception e) {
			// string ="Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/search_cancel_members" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String search_cancel_members(HttpServletRequest request) {
		String string = "";
		String string1 = "";
		String string2 = "";
		String string3 = "";
		String string4 = "";
		String string5 = "";
		String string6 = "";
		String string7 = "";
		String string8 = "";
		try {

			Add_Member us = AdminServ.GetUserName(request.getParameter("accountnumber"));
			string8 = us.getFullname();

			string1 = AdminServ.SearchDeadShareDetails(request.getParameter("accountnumber"));
			string2 = AdminServ.SearchDeadRDDetails(request.getParameter("accountnumber"));
			string3 = AdminServ.SearchDeadFDDetails(request.getParameter("accountnumber"));
			string4 = AdminServ.SearchDeadInsuranceDetails(request.getParameter("accountnumber"));
			string5 = AdminServ.SearchDeadMonthDepositDetails(request.getParameter("accountnumber"));
			string6 = AdminServ.SearchDeadRegularLoanDetails(request.getParameter("accountnumber"));
			string7 = AdminServ.SearchDeadEmergencyLoanDetails(request.getParameter("accountnumber"));

			string = string8 + ":" + string1 + ":" + string2 + ":" + string3 + ":" + string4 + ":" + string5 + ":"
					+ string6 + ":" + string7;
			// System.out.println("Search Cancel Details :
			// "+string8+":"+string1+":"+string2+":"+string3+":"+string4+":"+string5+":"+string6+":"+string7);

		} catch (Exception e) {
			// string ="Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/share_report" }, method = { RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String share_report(HttpServletRequest request) {
		String string = "Success";

		List<Trans_Share> share_details = AdminServ.Share_Report_Details(request.getParameter("accountnumber"),
				request.getParameter("sdate"), request.getParameter("edate"));
		javabeans.setShare_details(share_details);
		javabeans.setShare_date(request.getParameter("sdate") + " To " + request.getParameter("edate"));

		return string;
	}

	@RequestMapping(value = { "Admin/fd_report" }, method = { RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String fd_report(HttpServletRequest request) {
		String string = "Success";

		List<FixedDeposite> fd_details = AdminServ.FD_Report_Details(request.getParameter("accountnumber"),
				request.getParameter("sdate"), request.getParameter("edate"));
		javabeans.setFd_details(fd_details);
		javabeans.setFd_date(request.getParameter("sdate") + " To " + request.getParameter("edate"));

		return string;
	}

	@RequestMapping(value = { "Admin/rd_report" }, method = { RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String rd_report(HttpServletRequest request) {
		String string = "Success";

		List<RecurringDeposit> rd_details = AdminServ.RD_Report_Details(request.getParameter("accountnumber"),
				request.getParameter("sdate"), request.getParameter("edate"));
		javabeans.setRd_details(rd_details);
		javabeans.setRd_date(request.getParameter("sdate") + " To " + request.getParameter("edate"));

		return string;
	}

	@RequestMapping(value = { "Admin/loan_report" }, method = { RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String loan_report(HttpServletRequest request) {
		String string = "Success";

		List<Loan_Trans> new_loan_details = AdminServ.new_loan_Report_Details(request.getParameter("accountnumber"),
				request.getParameter("sdate"), request.getParameter("edate"));
		javabeans.setNew_loan_details(new_loan_details);
		javabeans.setNew_loan_date(request.getParameter("sdate") + " To " + request.getParameter("edate"));

		return string;
	}

	@RequestMapping(value = { "Admin/loan_close_report" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String loan_close_report(HttpServletRequest request) {
		String string = "Success";

		List<Loan_Closed> new_loan_details = AdminServ.new_loan_close_Report_Details(
				request.getParameter("accountnumber"), request.getParameter("sdate"), request.getParameter("edate"));
		javabeans.setNew_loan_close_details(new_loan_details);
		javabeans.setNew_loan_date(request.getParameter("sdate") + " To " + request.getParameter("edate"));

		return string;
	}

	@RequestMapping(value = { "Admin/emergency_loan_close_report" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String emergency_loan_close_report(HttpServletRequest request) {
		String string = "Success";

		List<Emergency_Loan_Close> new_loan_details = AdminServ.emergency_loan_close_Report_Details(
				request.getParameter("accountnumber"), request.getParameter("sdate"), request.getParameter("edate"));
		javabeans.setEmergency_loan_close_details(new_loan_details);
		javabeans.setNew_loan_date(request.getParameter("sdate") + " To " + request.getParameter("edate"));

		return string;
	}

	@RequestMapping(value = { "Admin/emergencyloan_report" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String emergencyloan_report(HttpServletRequest request) {
		String string = "Success";

		List<EmeregencyLoanTrans> emergency_loan_details = AdminServ.emergency_loan_Report_Details(
				request.getParameter("accountnumber"), request.getParameter("sdate"), request.getParameter("edate"));
		javabeans.setEmergency_loan_details(emergency_loan_details);
		javabeans.setEmergency_loan_date(request.getParameter("sdate") + " To " + request.getParameter("edate"));

		return string;
	}

	@RequestMapping(value = { "Admin/insurance_report" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String insurance_report(HttpServletRequest request) {
		String string = "Success";

		List<TransInsurance> insurance_details = AdminServ.Insurance_Report_Details(
				request.getParameter("accountnumber"), request.getParameter("sdate"), request.getParameter("edate"));
		javabeans.setInsurance_details(insurance_details);
		javabeans.setInsurance_date(request.getParameter("sdate") + " To " + request.getParameter("edate"));

		return string;
	}

	@RequestMapping(value = { "Admin/monthly_deposit_report" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String monthly_deposit_report(HttpServletRequest request) {
		String string = "Success";

		List<Trans_MonthlyDeposit> monthly_deposit_details = AdminServ.Monthly_Deposit_Report_Details(
				request.getParameter("accountnumber"), request.getParameter("sdate"), request.getParameter("edate"));
		javabeans.setMonthly_deposit_details(monthly_deposit_details);
		javabeans.setMonthly_deposit_date(request.getParameter("sdate") + " To " + request.getParameter("edate"));

		return string;
	}

	@RequestMapping(value = { "Admin/cancel_member_report" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String cancel_member_report(HttpServletRequest request) {
		String string = "Success";

		List<Cancel_Member> cancel_member_list = AdminServ.cancel_member_Report_Details(
				request.getParameter("accountnumber"), request.getParameter("sdate"), request.getParameter("edate"));
		javabeans.setCancel_member_details(cancel_member_list);
		javabeans.setCancel_member_date(request.getParameter("sdate") + " To " + request.getParameter("edate"));
		return string;
	}

	@RequestMapping(value = { "Admin/dead_member_report" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String dead_member_report(HttpServletRequest request) {
		String string = "Success";

		List<Dead_Member> dead_member_list = AdminServ.dead_member_Report_Details(request.getParameter("accountnumber"),
				request.getParameter("sdate"), request.getParameter("edate"));
		javabeans.setDead_member_details(dead_member_list);
		javabeans.setDead_member_date(request.getParameter("sdate") + " To " + request.getParameter("edate"));
		return string;
	}

	@RequestMapping(value = { "Admin/deduction_file" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String deduction_file(@RequestParam("files0") MultipartFile files0,
			@RequestParam("files1") MultipartFile files1) {
		String string = "Success";
		// System.out.println("hello");

		try {
			// Add_Member am = new Add_Member();

			// am.setImage1(files.getBytes());
			// System.out.println(files0.getOriginalFilename());
			// System.out.println(files1.getOriginalFilename());

			FileInputStream excellFile1 = (FileInputStream) files0.getInputStream();
			FileInputStream excellFile2 = (FileInputStream) files1.getInputStream();

			// AdminServ.CompareExcel(excellFile1, excellFile2);
			List<Deduction_Compare> deduction_compare = AdminServ.CompareExcel(excellFile1, excellFile2);

			// string = AdminServ.save_member(am);
			javabeans.setDeduction_compare(deduction_compare);

		} catch (Exception e) {
			string = "Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/SearchFDDetails" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String SearchFDDetails(HttpServletRequest request) {
		String string = "";
		String string1 = "";
		String string2 = "";
		String interesttype = "FD Interest";

		try {
			string1 = AdminServ.SearchMemberDetails(request.getParameter("accountnumber"));
			string2 = AdminServ.SearchChangeInterestDetails(interesttype);

			string = string1 + ":" + string2;
			// System.out.println("Search Cancel Details : "+string1+":"+string2);

		} catch (Exception e) {
			// string ="Fail";
			System.out.println(e);
		}

		return string;
	}

	@RequestMapping(value = { "Admin/month_deduction" }, method = {
			RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String month_deduction(HttpServletRequest request) {
		String string = "Success";
		String month = request.getParameter("month");
		String dt1[] = month.split("-");
		String dte1 = dt1[0] + "-" + dt1[1];
		System.out.println(month + "---" + dte1);
		javabeans.setCmonth(month);

		String d_flag = "Not Matched";
		List<TransInsurance> insuranceList = AdminServ.getTransInsuranceData();
		for (TransInsurance ins : insuranceList) {
			String accountno = ins.getAccountnumber();
			String idate = ins.getDate();

			String dt[] = idate.split("-");
			String dte = dt[0] + "-" + dt[1];
			// System.out.println(dte);
			if (dte1.equals(dte)) {
				System.out.println(dte1 + "-------" + dte + "   date matched");
				d_flag = "Matched";
				break;
			}
		}

		List<Add_Member> am = AdminServ.GetAllMemberInformation();
		if (d_flag == "Not Matched") {
			for (Add_Member add_memb : am) {
				String name = add_memb.getFullname();
				String account_number = add_memb.getAccountnumber();
				System.out.println(name + "      " + account_number);
				String string1 = AdminServ.GenerateMonthlyDeductionInsurance(account_number, name, month);
				String sharert = AdminServ.GenerateMonthlyDeductionShare(account_number, name, month);
				String MDrt = AdminServ.GenerateMonthlyDeductionMonthlyDeposite(account_number, name, month);
				String RDrt = AdminServ.GenerateMonthlyDeductionMonthlyRD(account_number, name, month);

				/*
				 * String TotalAmountTransrd = RDNR.findSumOfRdTotalAmount(account_number);
				 * if(TotalAmountTransrd != null) { String TotalAmount =
				 * RDNR.findSumOfRdTotalAmount(account_number); String TotalRDAmount =
				 * RDNR.findSumOfRdAmount(account_number); String RDtrt =
				 * AdminServ.GenerateMonthlyDeductionMonthlyRDTrans(account_number,
				 * name,TotalAmount,TotalRDAmount);
				 * System.out.println(account_number+"   :  "+RDtrt);
				 * 
				 * }
				 */

				String loanrt = AdminServ.GenerateMonthlyDeductionMonthlyLoan(account_number, name, month);
				String loanem = AdminServ.GenerateMonthlyDeductionMonthlyEmergencyLoan(account_number, name, month);

			}
		} else {
			string = "Fail";
		}

		// AdminServ.GenerateMonthlyDeductionMonthlyEmergencyLoan("1527", "jadhav laxman
		// bhimrao");
		return string;
	}

	@RequestMapping({ "Admin/day_report_print" })
	public String day_report_print(final Model model) {
		System.out.println("hello day_report_print");

		List<Third_Party_Payment> daily_report_details = javabeans.getDaily_report_print_details();
		model.addAttribute("daily_report_details", daily_report_details);

		String daily_report_date = javabeans.getDaily_report_date();
		model.addAttribute("daily_report_date", daily_report_date);
		return "Admin/day_report_print";
	}

	@RequestMapping({ "Admin/day_report" })
	public String day_report() {
		System.out.println("hello day_report");
		return "Admin/day_report";
	}

	@RequestMapping({ "Admin/admin_annual_report_print" })
	public String admin_annual_report_print(final Model model) {
		System.out.println("hello admin_annual_report_print");
		List<UserAnnualReport> anreprt = JavaBeans.getUseranReprt();
		model.addAttribute("User_Annual_Report", anreprt);
		return "Admin/admin_annual_report_print";
	}

	@RequestMapping(value = { "Admin/daily_report" }, method = { RequestMethod.POST }, consumes = "multipart/form-data")
	@ResponseBody
	public String daily_report(HttpServletRequest request) {
		String string = "Success";

		List<Third_Party_Payment> daily_report_details = AdminServ.Daily_Report_Details(request.getParameter("sdate"),
				request.getParameter("edate"));
		javabeans.setDaily_report_print_details(daily_report_details);
		javabeans.setDaily_report_date(request.getParameter("sdate") + " To " + request.getParameter("edate"));

		return string;
	}
}
