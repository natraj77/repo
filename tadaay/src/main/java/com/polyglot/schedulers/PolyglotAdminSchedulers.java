package com.polyglot.schedulers;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.polyglot.domain.AppPolyglotPlan;
import com.polyglot.domain.AppUsers;
import com.polyglot.service.AppPolyglotPlanService;
import com.polyglot.service.AppPolyglotRegistrationService;

/**
 * Scheduler class. Contains multiple schedulers to be run on the admin side. 
 * 1) Send notifications for the user, if the user plan is expired
 * 
 * @author vishw
 * 
 */

@Component
public class PolyglotAdminSchedulers {

	private static final Logger logger = Logger
			.getLogger(PolyglotAdminSchedulers.class);

	@Autowired
	private AppPolyglotRegistrationService userService;
	
	@Autowired
	private AppPolyglotPlanService planService;

	/**
	 * Scheduler to check the expiration of each plan for all the users
	 */
	public void runPlanScheduler() {
		logger.debug("Running the scheduler for checking if the default plan has expired");

		Timestamp currentTime = new Timestamp(Calendar.getInstance()
				.getTimeInMillis());

		List<AppUsers> partners = userService.getAll().stream().filter(p -> p.getUserType().equalsIgnoreCase("P")).collect(Collectors.toList());
		logger.debug("Total number of users : " + partners.size());
		for (AppUsers user : partners) {
			Set<AppPolyglotPlan> plans = user.getAppPolyglotPlans().stream().filter(p -> p.getIsExpired().equalsIgnoreCase("N")).collect(Collectors.toSet());
			logger.debug("Number of users that are not expired : " + plans.size());
			if (plans != null && plans.size() > 0) {
				// Check for any plans.
				// If only default plan exists, check if it is greater than 30
				// days
				// Else check for the duration
				for (AppPolyglotPlan plan : plans) {
					if (plan.getExpiredDate().after(currentTime)) {
						// Plan has expired.
						plan.setIsExpired("Y");
						// Update plan
						planService.save(plan);
						
						// Send notification for plan renewal

					}
				}

			}
		}

	}

}
