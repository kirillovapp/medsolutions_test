ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: 'Справочник врача'

  content title: proc{ I18n.t('active_admin.dashboard') } do
    columns do
      column do
        panel 'Последние новости' do
          table do
            News.last(5).map do |news|
              tr do
                td news.title
                td l(news.created_at, format: '%d %B, %H:%M ')
                td link_to('Просмотр', admin_news_path(news))
              end
            end
          end
        end
      end
    end
  end # content
end
