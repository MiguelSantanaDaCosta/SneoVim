" Plugin para integração com Apache TomEE
if exists('g:loaded_tomee') || &cp
  finish
endif
let g:loaded_tomee = 1

if !exists('g:tomee_path')
  let g:tomee_path = $HOME . '/tomee'
endif

command! -nargs=0 TomeeStart call s:StartTomee()
command! -nargs=0 TomeeStop call s:StopTomee()
command! -nargs=0 TomeeRestart call s:RestartTomee()
command! -nargs=0 TomeeDeploy call s:DeployToTomee()

function! s:StartTomee()
  execute '!'. g:tomee_path . '/bin/startup.sh'
  echo "TomEE started"
endfunction

function! s:StopTomee()
  execute '!'. g:tomee_path . '/bin/shutdown.sh'
  echo "TomEE stopped"
endfunction

function! s:RestartTomee()
  call s:StopTomee()
  sleep 2
  call s:StartTomee()
  echo "TomEE restarted"
endfunction

function! s:DeployToTomee()
  if filereadable('pom.xml')
    execute '!mvn clean package'
    execute '!cp target/*.war '. g:tomee_path . '/webapps/'
    echo "Application deployed to TomEE"
  else
    echo "Error: pom.xml not found!"
  endif
endfunction
