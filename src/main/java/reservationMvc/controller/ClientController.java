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

import reservationSpring.model.Client;
import reservationSpring.model.ClientEI;
import reservationSpring.model.ClientMoral;
import reservationSpring.model.ClientPhysique;
import reservationSpring.model.Titre;
import reservationSpring.repository.ClientRepository;

@Controller
@RequestMapping("/client")
public class ClientController {

	@Autowired
	private ClientRepository clientRepository;

	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("clients", clientRepository.findAll());
		return "client/list";
	}

	@GetMapping("/delete")
	public String delete(@RequestParam(name = "id", required = true) Long id) {
		clientRepository.deleteById(id);
		return "redirect:/client/list";
	}

	@GetMapping("/edit")
	public String edit(@RequestParam(name = "id", required = true) Long id, Model model) {
		Optional<Client> opt = clientRepository.findById(id);
		Client c = null;
		if (opt.isPresent()) {
			c = opt.get();
		} else {
			c = new ClientEI();
		}
		return goEdit(c, model);
	}

	private String goEdit(Client client, Model model) {
		model.addAttribute("client", client);
		model.addAttribute("titres", Titre.values());
		return "client/edit";
	}

	private String saveClient(Client client, Model model) {
		clientRepository.save(client);
		return "redirect:/client/list";
	}

	@PostMapping("/saveClientEI")
	public String saveClientEI(@ModelAttribute("client") ClientEI clientEI, Model model) {
		return saveClient(clientEI, model);
	}

	@PostMapping("/saveClientMoral")
	public String saveClientMoral(@ModelAttribute("client") ClientMoral clientMoral, Model model) {
		return saveClient(clientMoral, model);
	}

	@PostMapping("/saveClientPhysique")
	public String saveClientPhysique(@ModelAttribute("client") ClientPhysique clientPhysique, Model model) {
		return saveClient(clientPhysique, model);
	}

	@GetMapping("/addClientEI")
	public String addClientEI(Model model) {
		return goEdit(new ClientEI(), model);
	}

	@GetMapping("/addClientMoral")
	public String addClientMoral(Model model) {
		return goEdit(new ClientMoral(), model);
	}

	@GetMapping("/addClientPhysique")
	public String addClientPhysique(Model model) {
		return goEdit(new ClientPhysique(), model);
	}

}
