;; bepo.nvim: bepo mapping for neovim
;; Copyright 2022 Clément Joly
;;
;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;;     http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.
;;
;; Credit: Inspired by https://github.com/michamos/vim-bepo by Micha Moskovic

(fn map-text-object [key target]
  "For text-objects mappings"
  (if (= (vim.fn.maparg key :o) "")
      (vim.api.nvim_set_keymap :o key target {:noremap true})
      (= (vim.fn.maparg key :x) "")
      (vim.api.nvim_set_keymap :x key target {:noremap true}))
  nil)

(fn map-all [key target]
  "For everything else"
  (if (= (vim.fn.maparg key :n) "")
      (vim.api.nvim_set_keymap :n key target {:noremap true})
      (map-text-object key target)))

(fn mapping-setup []
  ;; Keys still free
  ;; , and ; as they may be used as leaders
  ;; à and À
  ;; on préserve {hjkl} pour les directions
  (map-all :c :h)
  (map-all :t :j)
  (map-all :s :k)
  (map-all :r :l)
  (map-all :C :H)
  ;; ------
  ;; {HJKL} devient [CTSR]
  (map-all :T :J)
  (map-all :S :K)
  (map-all :R :L)
  ;; {HJKL} devient [CTSR] -> free R
  ;; ------
  ;; on préserve les variantes avec 'g' 
  (map-all :gt :gj)
  (map-all :gs :gk)
  ;; ------
  ;; on préserve les variantes avec 'z'
  ;; I like zt better
  ;; (map-all "zt" "zj")
  (map-all :zs :zk)
  ;; ------
  (map-all :h :t)
  ;; {t} devient [h] pour être proche de [f]
  (map-all :H :T)
  ;; idem pour {T} et [H]
  (map-all :l :c)
  ;; {c} devient [l]
  (map-all :L :C)
  ;; {C} devient [L]
  (map-all :j :r)
  ;; {j} devient [r]
  (map-all :J :R)
  ;; {J} devient [R]
  (map-all :k :s)
  ;; {k} devient [s]
  (map-all :K :S)
  ;; {h} devient [S]
  (map-all :gb :gT)
  ;; le couple [gb]/[gé] agit sur les tabs
  (map-all "gé" :gt)
  ;; le couple [gb]/[gé] agit sur les tabs
  (map-all :gB ":execute \"silent! tabfirst\"<CR>")
  ;; [gB] va au premier tab
  (map-all "gÉ" ":execute \"silent! tablast\"<CR>")
  ;; [gÉ] au dernier
  (map-all :gT "<C-]>")
  ;; [gT] est libéré et peut agir sur les tags
  (map-all "«" "<")
  ;; [<] est moins accessible que [«]
  (map-all "»" ">")
  ;; idem pour [»] et [>]
  (map-all "g," "g;")
  ;; idem pour [g,] et [g;]
  (map-all "g;" "g,")
  ;; qui sont permutés
  (map-all "é" :w)
  ;; [w] est peu accessible, on utilise [é]
  (map-all "É" :W)
  ;; idem pour [W] et [É]
  ;; ------
  (map-text-object "aé" :aw)
  ;; idem pour [aw] et [aé]
  (map-text-object "aÉ" :aW)
  ;; idem pour [aW] et [aÉ]
  (map-text-object "ié" :iw)
  ;; idem pour [iw] et [ié]
  (map-text-object "iÉ" :iW)
  ;; idem pour [iW] et [iÉ]
  ;; ------
  (map-all :w :<C-w>)
  ;; [w] est libre pour faire <C-w>
  (map-all :W :<C-w><C-w>)
  ;; et [w] pour faire <C-w><C-w>
  (map-all :wc :<C-w>h)
  ;; on map [w]+direction
  (map-all :wt :<C-w>j)
  ;; on map [w]+direction
  (map-all :ws :<C-w>k)
  ;; on map [w]+direction
  (map-all :wr :<C-w>l)
  ;; on map [w]+direction
  (map-all :wC :<C-w>H)
  ;; idem pour les majuscules
  (map-all :wT :<C-w>J)
  ;; idem pour les majuscules
  (map-all :wS :<C-w>K)
  ;; idem pour les majuscules
  (map-all :wR :<C-w>L)
  ;; idem pour les majuscules
  ;; ------
  (map-all :wh :<C-w>s)
  ;; crée un split _h_orizontal
  ;; ------
  (map-all "wé" :<C-w>t)
  ;; va en haut à gauche
  (map-all "wÉ" :<C-w>T)
  ;; déplace sur un nouveau tab
  )

(fn setup []
  (when (= vim.g.loaded_bepo_nvim nil)
    (mapping-setup)
    (set vim.g.loaded_bepo_nvim 1)))

{: setup}

