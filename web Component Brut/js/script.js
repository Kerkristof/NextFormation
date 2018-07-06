// Angular s'appuie sur des web components
// la nouvelle méthode ou le futur web

//Ce sont des ensembles de specifications du w3c définissant les api permettant la création de balises réutilisables

// Par ex on pourrait avoir dans notre programmeune balise <formation-next></formation-next>
// Le navigateur ne comprend que du html donc à un moment donné, quand un dev voudra creer sa balise,
// il devra generer du html pure et pour cela, il y a les templates.

class FormationNext extends HTMLElement {
    constructor(){
        // super() instancie le constructeur de la classe mère
        super();
    }
    //la méthode connectedCallBack permet d'avoir accés au cycle de vie de notre page
    connectedCallback(){
        console.log('cette méthode permet d\'être au courant du fait que le composant est connecté à l\'arbre du DOM');
        // On creer un shadowDom qui sera public ou privé open ou close et on le stoke dans une variable shadowDom.
        // attachShadow prend en paramètre un objet qui spécife le mode open or close.
        let shadowDom = this.attachShadow({mode:'open'});

        let template = document.querySelector('#templateNextFormation');

        // shadowDom.innerHTML = "<h3>Next is best</h3>";
        shadowDom.innerHTML = template.innerHTML;
    }
}
window.customElements.define('formation-next',FormationNext);