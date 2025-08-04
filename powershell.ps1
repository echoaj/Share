- name: Query for 4656 with Audit Failure since start time
  become: yes
  become_user: Administrator
  ansible.windows.win_shell: |
    $Start = [datetime]::Parse('{{ check_start.stdout | trim }}')
    $events = Get-WinEvent -FilterHashtable @{ LogName='Security'; Id=4656; StartTime=$Start } |
              Sort-Object TimeCreated -Descending

    $match = $null
    foreach ($evt in $events) {
      if ($evt.KeywordsDisplayNames -contains 'Audit Failure') {
        $audit = 'Audit Failure'
        $match = [PSCustomObject]@{
          found       = $true
          pass        = $true
          reason      = 'Matched 4656 with Audit Failure'
          timeCreated = $evt.TimeCreated
          id          = $evt.Id
          audit       = $audit
          logName     = $evt.LogName
        }
        break
      }
    }

    if ($null -eq $match) {
      $match = [PSCustomObject]@{
        found       = $false
        pass        = $false
        reason      = 'No 4656 events with Audit Failure since start time'
        timeCreated = $null
        id          = $null
        audit       = $null
        logName     = 'Security'
      }
    }

    $match | ConvertTo-Json -Depth 5
  register: evt_check
  changed_when: false