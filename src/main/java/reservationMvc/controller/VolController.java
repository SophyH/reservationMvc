package reservationMvc.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import reservationSpring.model.Vol;
import reservationSpring.repository.VolRepository;

@Controller
@RequestMapping("/vol")
public class VolController {

	@Autowired
	private VolRepository volRepository;
	
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("vol", volRepository.findAll());
		return "vol/list";
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam(name="id", required =true) Integer id) {
		volRepository.deleteById((long)id);
		return "redirect:/vol/list";
	}
	
	@GetMapping("edit")
	public String edit(@RequestParam(name="id", required =true) Integer id, Model model) {
		Optional<Vol> opt=volRepository.findById((long)id);
		Vol v =null;
		if(opt.isPresent()) {
			v=opt.get();
		}else {
			v = new Vol();
		}
		model.addAttribute("vol",v);
		return goEdit(v,model);
	}
	
	private String goEdit(Vol vol, Model model) {
		model.addAttribute("vol",vol);
		return "vol/edit";
		
	}
	
	@GetMapping("/addVol")
	public String addSalle(Model model) {
		return goEdit(new Vol(),model);
		
	}
	
	@PostMapping("/saveVol")
	public String saveVol(@ModelAttribute("vol") Vol vol,Model model) {
		volRepository.save(vol);
		return "redirect:/vol/list";
	}
	
	
	
	
}
