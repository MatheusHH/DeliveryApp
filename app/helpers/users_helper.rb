module UsersHelper
    ESTADOS_BRASILEIROS = [
        ["Acre", "AC"],
        ["Alagoas", "AL"],
        ["Amapá", "AP"],
        ["Amazonas", "AM"],
        ["Bahia", "BA"],
        ["Ceará", "CE"],
        ["Distrito Federal", "DF"],
        ["Espírito Santo", "ES"],
        ["Goiás", "GO"],
        ["Maranhão", "MA"],
        ["Mato Grosso", "MT"],
        ["Mato Grosso do Sul", "MS"],
        ["Minas Gerais", "MG"],
        ["Pará", "PA"],
        ["Paraíba", "PB"],
        ["Paraná", "PR"],
        ["Pernambuco", "PE"],
        ["Piauí", "PI"],
        ["Rio de Janeiro", "RJ"],
        ["Rio Grande do Norte", "RN"],
        ["Rio Grande do Sul", "RS"],
        ["Rondônia", "RO"],
        ["Roraima", "RR"],
        ["Santa Catarina", "SC"],
        ["São Paulo", "SP"],
        ["Sergipe", "SE"],
        ["Tocantins", "TO"]
    ]

    def render_states_devise(name)
        select_tag(name, options_for_select(ESTADOS_BRASILEIROS), class: "form-control", prompt: "Selecione o Estado", style: "border-radius: 10rem")
    end
end
