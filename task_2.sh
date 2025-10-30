path_to_add=$1

echo "Текущее значение переменной PATH: $PATH"

echo "Выполняю export PATH=$PATH:$1"
export PATH=$PATH:$1
echo "Новое значение PATH вступило в силу в текущей сессии"

echo "export PATH=$PATH:$1" >> ~/.bashrc
echo "Новое значение PATH добавлено в bashrc"
echo "Для постоянного использования выолнените source ~/.bashrc"
