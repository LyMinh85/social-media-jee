package com.example.socialmedia.entity;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JpaManager {
    private static final String PERSISTENCE_UNIT_NAME = "social_media";
    private static final EntityManagerFactory emFactory;

    // khi bat dau chay chuong trinh, thuc hien lenh static dau tien
    static {
        //  tạo một EntityManagerFactory để quản lý các EntityManager trong ứng dụng JPA
        emFactory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
    }

    public static EntityManager getEntityManager() {
        return emFactory.createEntityManager();
    }

    public static void closeEntityManager(EntityManager em) {
        if (em != null && em.isOpen()) {
            em.close();
        }
    }

    public static void beginTransaction(EntityManager em) {
        em.getTransaction().begin();
    }

    public static void commitTransaction(EntityManager em) {
        em.getTransaction().commit();
    }

    public static void rollbackTransaction(EntityManager em) {
        em.getTransaction().rollback();
    }

    public static void closeEntityManagerFactory() {
        if (emFactory != null && emFactory.isOpen()) {
            emFactory.close();
        }
    }
}
