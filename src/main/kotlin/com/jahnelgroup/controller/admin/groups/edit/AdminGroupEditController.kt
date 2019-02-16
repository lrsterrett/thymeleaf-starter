package com.jahnelgroup.controller.admin.groups.edit

import com.jahnelgroup.domain.user.group.GroupRepo
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestParam

@Controller
class AdminGroupEditController(private var groupRepo: GroupRepo){

    @GetMapping("/admin/groups/{groupId}")
    fun search(model: Model, @PathVariable groupId: Long): String {
        model.addAttribute("group", groupRepo.findById(groupId).get())
        return "layouts/admin/groups/edit"
    }

}