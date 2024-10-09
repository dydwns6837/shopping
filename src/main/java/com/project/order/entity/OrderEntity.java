package com.project.order.entity;

import java.util.Date;

import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Builder(toBuilder = true)
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Table(name = "orders")
@Entity
public class OrderEntity {

   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   private int id;

   @Column(name = "userId")
   private int userId;

   @Column(name = "basketId")
   private int basketId;

   @Column(name = "orderNumber")
   private String orderNumber;

   @Column(name = "buyerName")
   private String buyerName;

   @Column(name = "recipientName")
   private String recipientName;

   @Column(name = "recipientPhone")
   private String recipientPhone;

   @Column(name = "recipientAddress")
   private String recipientAddress;

   @Column(name = "paymentMethod")
   private String paymentMethod;

   @UpdateTimestamp
   @Column(name = "createdAt", updatable = false)
   private Date createdAt;

   @UpdateTimestamp
   @Column(name = "updatedAt")
   private Date updatedAt;
}
