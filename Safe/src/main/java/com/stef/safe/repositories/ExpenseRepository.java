package com.stef.safe.repositories;
//always make sure to open an interface not a class 

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.stef.safe.models.Expense;


	@Repository
	public interface ExpenseRepository extends CrudRepository<Expense, Long> {
		// this method retrieves all the books from the database
	    List<Expense> findAll();

	}

