
df3<-read.table("fivepcounts-filtered-RPF-siLuc.txt")
df3$relative.pos <- df3$V3-df3$V9
df4<-df3 %>% group_by(relative.pos) %>% dplyr::summarise(sum=sum(V4)/1000)


df<-read.table("fivepcounts-filtered-RPF-siLin28a.txt")
df$relative.pos <- df$V3-df$V9
df2<-df %>% group_by(relative.pos) %>% dplyr::summarise(sum=sum(V4)/1000)

df4 %>% ggplot(aes(x=relative.pos,y=sum),color=black)+
  geom_vline(xintercept=0,color='red', size =0.5)+
  geom_col(fill="black") +
  ylim(0,115)+
  xlim(-50,50)+
  labs(x='Relative position to start codon of 5\'-end of reads',
       y='siLuc \n raw reads count \n (x1000)',
       title='Figure 5SA')+
  theme_bw()


df2 %>% ggplot(aes(x=relative.pos,y=sum),color=black)+
  geom_vline(xintercept=0,color='red', size =0.5)+
  geom_col(fill="black") +
  ylim(0,115)+
  xlim(-50,50)+
  labs(x='Relative position to start codon of 5\'-end of reads',
       y='siLin28a \n Raw reads count \n (x1000)',
       title='Figure 5SA')+
  theme_bw()
