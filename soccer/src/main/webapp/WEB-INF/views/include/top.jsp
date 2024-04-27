<%@page import="org.springframework.beans.factory.parsing.ReaderContext"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko" data-bs-theme="auto">
  <head>
    <meta charset="utf-8">
    <title>EPL&IMF</title>
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.3/examples/blog/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Favicons -->
<meta name="theme-color" content="#712cf9">
    <style>
      body{
        width: 100%;
      }
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

  
      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
  
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }


      .container {
    padding-left: 1rem;
    padding-right: 1rem;
    margin-left: auto;
    margin-right: auto;
    max-width: 100%;
  }
 
  
  .bg-2{
    color: rgb(255, 255, 255);
    font-size: 1rem;
    mix-blend-mode: difference;
  }
  nav a{
    margin-left: auto;
    margin-right: auto;
  }
  main{
    margin: 0.9%;
       }
    </style>
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
  </head>
  <body>
 
<div class="container">
  <header class="border-bottom lh-1 py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
        <a class="link-secondary" href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/resources/img/epl2.jpg" alt="" style="width: 10rem;"></a>
      </div>
      <div class="col-4 text-center">
        <h1 class="display-3 fw-bolder">EPL⚽ISC</h1>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
      <c:if test="${user_id==null}">
        <a class="btn btn-sm btn-outline-secondary" href="login" style="width: 5rem; height: 3rem;"><p style="margin-top: 0.4rem; font-size: 1rem;">Sign up</p></a>
        </c:if>
        <c:if test="${user_id!=null}">
        <h4 class="fst-italic" >USER : ${user_id} </h4>
      	<a class="btn btn-sm btn-outline-secondary" href="purchaselist?pur_id=${user_id }" style=" margin-left: 1rem; text-align: center;">
    	<p style="margin-top: 0.8rem; font-size: 1rem; ">Purchase list</p>
		</a>
        <a class="btn btn-sm btn-outline-secondary" href="myinfo?user_id=${user_id}" style="  margin-left:1rem; text-align: center;">
        <p style="margin-top: 0.8rem; font-size: 1rem;">My Info</p>
        </a>
        <a class="btn btn-sm btn-outline-secondary" href="logout" style=" margin-left:1rem; text-align: center;">
        <p style="margin-top: 0.8rem; font-size: 1rem;">logout</p>
        </a>
        </c:if>
      </div>
    </div>
  </header>

  <div class="nav-scroller py-1 mb-3 border-bottom">
    <nav class="nav nav-underline justify-content-between">
      <a class="nav-item nav-link link-body-emphasis active" href="information">Club Information</a>
      <a class="nav-item nav-link link-body-emphasis active" href="clubshop">Club Shop</a>
      <a class="nav-item nav-link link-body-emphasis active" href="clubcommunity">Club Community</a>
    </nav>
    </div>
    
    </div>
    </body>