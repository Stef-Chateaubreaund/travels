package com.stef.safe.controllers;


import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.stef.safe.models.Expense;
import com.stef.safe.services.ExpenseService;

@Controller
public class HomeController {
	
	@Autowired
	ExpenseService expenseService;

	
	// --------------------- Home - showing all expense and add expense form
	

	@GetMapping("/expenses")
	public String index(Model model, @ModelAttribute("expense") Expense expense) {
		
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		
		
		return "stef.jsp";
	}
//     show one --- 
		@GetMapping("/expenses/showOne/{id}")
		public String showOne(Model model,@PathVariable(value="id") long id) {
			
				Expense expense = expenseService.findExpense(id);
				
				model.addAttribute("expense", expense);

					return "show.jsp";
		}
		
		//----------------- Create  Expense  Processing  
		
		// create expense processing
	@PostMapping("/")
	public String createExpense(
				@Valid 
				@ModelAttribute("expense") Expense expense, BindingResult result) {
			
			if (result.hasErrors()) {
	            return "index.jsp";
	            
	        } else {
	        	
	            expenseService.createExpense(expense);
	            return "redirect: /expenses";
	        }
		}

	
		// page for updating an expense
		@GetMapping("/expenses/update/{id}")
		public String expenseUpdate(Model model, @PathVariable(value="id") long id) {
			
			Expense expense = expenseService.findExpense(id);
			
			model.addAttribute("expense", expense);	
			
			return "update.jsp";
		}
			
			
		// Update Expense processing
		@PutMapping( value="/update/{id}")
		public String expenseUpdateProcess(
				@Valid 
				@ModelAttribute("expense") Expense expense, BindingResult result) {
			
			if (result.hasErrors()) {        
	            return "update.jsp";
	        } else {
	            
	        	expenseService.updateExpense(expense.getId(), expense.getName(), expense.getVendor(), expense.getAmount(), expense.getDescription());
	            return "redirect:/expenses";
	        }
		}
		// delete expense processing
		@GetMapping("/expenses/delete/{id}")
		public String delete(@PathVariable("id") Long id) {
			expenseService.deleteExpense(id);
			return "redirect:/expenses";
		}
	

}
