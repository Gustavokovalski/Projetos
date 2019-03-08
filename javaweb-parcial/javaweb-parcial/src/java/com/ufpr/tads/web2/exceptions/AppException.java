/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.exceptions;

/**
 *
 * @author TC823830
 */
public class AppException extends Exception {
  public AppException() { 
      super();
  }
  public AppException(String message) { 
      super(message); 
  }
  public AppException(String message, Throwable cause) { 
      super(message, cause);
  }
  public AppException(Throwable cause) { 
      super(cause);
  }
}
