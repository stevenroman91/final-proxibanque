package fr.gtm.finalproxibanque.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import fr.gtm.finalproxibanque.business.ClientService;
import fr.gtm.finalproxibanque.domain.Client;
import fr.gtm.finalproxibanque.domain.MauvaiseDateException;

/**
 * La class ClientController est un web service qui permet de dispatcher les
 * requetes HTTP concernant l'entité client
 *
 * @author Kamir Elsisi, Steven Roman, Antoine Volatron
 *
 */
@RestController
@RequestMapping("/client")
public class ClientController {

	private static final Logger LOGGER = LoggerFactory.getLogger(ClientController.class);

	@Autowired
	private ClientService clientService;

	/**
	 * La methode addClient est un WebService déclenchant la création d'un nouveau
	 * client
	 *
	 * @param client
	 *            Client à persister en base de donnée
	 * @return Le client persisté
	 * @throws MauvaiseDateException
	 *             Erreur relever si la date de fin rensigné est antérieur à la date
	 *             de début de sondage
	 */
	@PostMapping({ "", "/" })
	public Client addClient(@RequestBody final Client client) throws MauvaiseDateException {
		ClientController.LOGGER.info("un client a été créé en base -- méthode addClient -- class ClientController");
		return this.clientService.create(client);
	}

	/**
	 * La methode getClient est un WebService permettant de retourner un client à
	 * partir de son id
	 *
	 * @param id
	 *            Id du client recherché
	 * @return Le client enregistré en base correspondant à l'id
	 */
	@RequestMapping("/{id}")
	public Client getClient(@PathVariable final Integer id) {
		ClientController.LOGGER
				.info("Je récupere un client grâce à son id -- méthode getClient -- class ClientController");
		return this.clientService.read(id);
	}

	/**
	 * La methode getClient est un WebService permettant de retourner un client à
	 * partir de son numéro d'identification
	 *
	 * @param num
	 *            numéro d'identification du client recherché
	 * @return Le client enregistré en base correspondant au numéro
	 */
	@RequestMapping("/numero/{num}")
	public Client getClient(@PathVariable final String num) {
		ClientController.LOGGER
				.info("Je récupere un client grâce à son numéro -- méthode getClient -- class ClientController");
		return this.clientService.findByClientNumber(num);
	}

}
