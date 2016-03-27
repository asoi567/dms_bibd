at_nom = Dmsf::AnalyticType.create name: 'Номенклатура'
at_nom_as = []
at_nom_as << at_nom.analytics.create(name: 'Песок')
at_nom_as << at_nom.analytics.create(name: 'Цемент')
at_nom_as << at_nom.analytics.create(name: 'Клей')
at_nom_as << at_nom.analytics.create(name: 'Фанера')
at_nom_as << at_nom.analytics.create(name: 'Кирпич')
at_nom_as << at_nom.analytics.create(name: 'Гвозди')
at_nom_as << at_nom.analytics.create(name: 'Краска')
at_nom_as << at_nom.analytics.create(name: 'Доски')

at_mat = Dmsf::AnalyticType.create name: 'Материально-ответственное лицо'
at_mat_as = []
at_mat_as << at_mat.analytics.create(name: 'Иванов Петр Сидорович')
at_mat_as << at_mat.analytics.create(name: 'Петров Сидор Иванович')
at_mat_as << at_mat.analytics.create(name: 'Сидоров Иван Петрович')

at_acc = Dmsf::AnalyticType.create name: 'Расчетный счет'
at_acc_1 = at_acc.analytics.create(name: 'Основной расчетный счет')

at_con = Dmsf::AnalyticType.create name: 'Контрагент'
at_con_as = []
at_con_as << at_con.analytics.create(name: 'ООО "Меруа Лерлен"')
at_con_as << at_con.analytics.create(name: 'ООО "HDstroy All In One"')
at_con_as << at_con.analytics.create(name: 'АО "ОЗИЛЮКС"')

a10 = Dmsf::Account.create code: '10-1', name: 'Сырье и материалы', kind: 'only_debit',
    analytic_type1: at_nom, analytic_type2: at_mat
a51 = Dmsf::Account.create code: '51', name: 'Расчетные счета', kind: 'only_debit', analytic_type1: at_acc
a60 = Dmsf::Account.create code: '60', name: 'Расчеты с поставщиками и подрядчиками',
    kind: 'only_credit', analytic_type1: at_con
a75 = Dmsf::Account.create code: '75', name: 'Расчеты с учредителями', kind: 'debit_credit'
a80 = Dmsf::Account.create code: '80', name: 'Уставный капитал', kind: 'debit_credit'


dd_spr = Dmsf::DocumentDefinition.create name: 'Бухгалтерская справка'
dd_vyp = Dmsf::DocumentDefinition.create name: 'Выписка по расчетному счету'
dd_nkl = Dmsf::DocumentDefinition.create name: 'Накладная'

so_nuk = Dmsf::StandardOperation.create name: 'Отражен уставный капитал после государственной регистрации организации.',
    document_definition: dd_spr, debits_account: a75, credits_account: a80
so_ouk = Dmsf::StandardOperation.create name: 'Поступили денежные средства в счет вкладов учредителей в уставный капитал.',
    document_definition: dd_vyp, debits_account: a51, credits_account: a75
so_pmz = Dmsf::StandardOperation.create name: 'Поступили материально-производственные запасы.',
    document_definition: dd_nkl, debits_account: a10, credits_account: a60
so_omz = Dmsf::StandardOperation.create name: 'Оплачены приобретенное имущество, работы (услуги).',
    document_definition: dd_vyp, debits_account: a60, credits_account: a51

today = Time.current.to_date
current_qarter = Time.current.all_quarter
q_start = current_qarter.first.to_date
q_end = current_qarter.last.to_date
uk_date = (q_start - 1.month).to_date

Dmsf::Document.create document_definition: dd_spr, name: dd_spr.name, number: '1', date: uk_date,
    standard_operation: so_nuk, analytics: [],
    entry_attributes: {debits_account: a75, credits_account: a80, amount: 100_000, date: uk_date }

Dmsf::Document.create document_definition: dd_vyp, name: dd_vyp.name, number: '1', date: uk_date,
    standard_operation: so_ouk, analytics: [at_acc_1],
    entry_attributes: {debits_account: a51, credits_account: a75, amount: 100_000, date: uk_date }

50.times do |n|
  date = (uk_date..today).to_a.sample
  Dmsf::Document.create document_definition: dd_nkl, name: dd_nkl.name, number: (n + 1).to_s, date: date,
      standard_operation: so_pmz, analytics: [at_nom_as.sample, at_mat_as.sample, at_con_as.sample],
      entry_attributes: {debits_account: a10, credits_account: a60, amount: (rand(100) + 1) * 100 , date: date }
end

5.times do |n|
  date = (uk_date..today).to_a.sample
  Dmsf::Document.create document_definition: dd_vyp, name: dd_vyp.name, number: (n + 2).to_s, date: date,
      standard_operation: so_omz, analytics: [at_con_as.sample],
      entry_attributes: {debits_account: a60, credits_account: a51, amount: (rand(100) + 1) * 1000 , date: date }
end
