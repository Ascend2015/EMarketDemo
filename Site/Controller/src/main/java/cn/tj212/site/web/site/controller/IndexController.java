package cn.tj212.site.web.site.controller;

import cn.tj212.emarket.deal.service.DealCategoryService;
import cn.tj212.emarket.deal.service.DealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
    @Autowired
    private DealService dealService;

    @Autowired
    private DealCategoryService dealCategoryService;

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String index(Model model){
        //1.分类
        //2.首页商品
        //3.每个大分类下，显示8个商品
        return "index";
    }
}
