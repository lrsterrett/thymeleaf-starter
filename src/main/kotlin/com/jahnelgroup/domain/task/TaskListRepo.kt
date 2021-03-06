package com.jahnelgroup.domain.task

import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query

interface TaskListRepo : JpaRepository<TaskList, Long>{

    @Query("select tl from TaskList tl where tl.createdBy = ?#{ principal?.username }")
    fun findByCurrentUser() : List<TaskList>

}
