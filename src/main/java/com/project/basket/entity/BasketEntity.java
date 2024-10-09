package com.project.basket.entity;

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

@Builder(toBuilder=true)
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Table(name="basket")
@Entity
public class BasketEntity {
      
      @Id
      @GeneratedValue(strategy=GenerationType.IDENTITY)
      private int id;
      
      @Column(name="userId")
      private int userId;
      
      @Column(name="clothName")
      private String clothName;
      
      @Column(name="clothSize")
      private String clothSize;
      
      @Column(name="clothCount")
      private int clothCount;
      
      @Column(name="clothStatus")
      private String clothStatus;
      
      @UpdateTimestamp
      @Column(name="createdAt", updatable=false)
      private Date createdAt;
      
      @UpdateTimestamp
      @Column(name="updatedAt")
      private Date updatedAt;
   
}