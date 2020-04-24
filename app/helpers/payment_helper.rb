module PaymentHelper
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

    MESES_ANO = [
        ["Janeiro", "1"],
        ["Fevereiro", "2"],
        ["Março", "3"],
        ["Abril", "4"],
        ["Maio", "5"],
        ["Junho", "6"],
        ["Julho", "7"],
        ["Agosto", "8"],
        ["Setembro", "9"],
        ["Outubro", "10"],
        ["Novembro", "11"],
        ["Dezembro", "12"]
    ]


    def render_states(name)
        select_tag(name, options_for_select(ESTADOS_BRASILEIROS), class: "form-control", prompt: "Estados")
    end

    def render_months(name)
        select_tag(name, options_for_select(MESES_ANO), class: "form-control", prompt: "Mês")
    end

    def render_months_card(name)
        select_tag(name, options_for_select(MESES_ANO), class: "form-control", prompt: "Mês de Expiração")
    end

    def credit_card_expiration_year_range
        (Time.now.strftime("%y").to_i - 2..(Time.now.strftime("%y").to_i + 15)).to_a
    end

    def birthdate_year_range
        ((Time.now.year - 80)..(Time.now.year - 15)).to_a.reverse
    end
end